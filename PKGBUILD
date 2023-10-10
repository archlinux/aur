# Maintainer: Mads Mogensen <mads256h at gmail dot com>

_pkgname=uppaal
pkgname=uppaal5
pkgver=5.0.0
pkgrel=2
pkgdesc="Uppaal is an integrated tool environment for modeling, validation and verification of real-time systems modeled as networks of timed automata, extended with data types (bounded integers, arrays, etc.)."
arch=('x86_64')
url="https://uppaal.org/"
license=('custom')
depends=('jre11-openjdk')
makedepends=('unzip')
_zipname="${_pkgname}-${pkgver}-linux64"
_zip="${_zipname}.zip"
source=("https://download.uppaal.org/uppaal-5.0/${_pkgname}-${pkgver}/${_zip}" "uppaal5.desktop")
noextract=("${_zip}")
sha256sums=('86d66d8cd25c00f6f45156617f3a7566f1f4fe7aed74dd171bfc9ef27a2c61ce'
            '0cde44f7653b898ac8504e8a0c3821c507e3c482020a4615e98605992dfd6e4e')

package () {
  install -d "${pkgdir}/opt/"
  unzip "${srcdir}/${_zip}" -d "${pkgdir}/opt/"
  mv "${pkgdir}/opt/${_zipname}" "${pkgdir}/opt/${pkgname}"
  sed -i 's|java|/usr/lib/jvm/java-11-openjdk/bin/java|' "${pkgdir}/opt/${pkgname}/uppaal"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/uppaal" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m644 "${srcdir}/uppaal5.desktop" "${pkgdir}/usr/share/applications/uppaal5.desktop"
}

