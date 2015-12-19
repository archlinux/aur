# Maintainer: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Contributor: Attila Bukor <r1pp3rj4ck@w4it.eu>

pkgname=apache-cxf
pkgver=3.1.4
pkgrel=1
pkgdesc='open source services framework'
arch=('any')
license=('Apache')
url='http://cxf.apache.org'
depends=('java-runtime')
options=('!strip')
source=("http://www.us.apache.org/dist/cxf/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'apache-cxf.sh')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d \
    "${pkgdir}/usr/share/java/${pkgname}/lib" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/etc/profile.d"

  cp -r "${srcdir}/${pkgname}-${pkgver}/lib/"* \
          "${pkgdir}/usr/share/java/${pkgname}/lib"
  rm "${pkgdir}/usr/share/java/${pkgname}/lib/WHICH_JARS"
  cp -r "${srcdir}/${pkgname}-${pkgver}/docs/api" \
          "${pkgdir}/usr/share/doc/${pkgname}"

  cp -r "${srcdir}/${pkgname}-${pkgver}/bin" "${pkgdir}/usr/"
  find "${pkgdir}/usr/bin/" -name '*.bat' -delete

  # to resolve conflict between midnight commander and apache-cxf
  mv "${pkgdir}/usr/bin/mc" "${pkgdir}/usr/bin/apache-mc"

  install -m 644  "${srcdir}/apache-cxf.sh" "${pkgdir}/etc/profile.d"
}

sha256sums=('e15d604198826307a30dba63e74df8628435abe7f7cc89d7682d4c10ba98f1aa'
            'c52ba86604138776e50f6fc9506e21ad6f30064a54a0aaef3d5316245b14e668')
