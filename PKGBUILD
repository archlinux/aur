# Maintainer: Nicola Squartini <tensor5@gmail.com>
pkgname=systemsim-cell
pkgver=3.1
pkgrel=2
pkgdesc="IBM Full-System Simulator for the Cell Broadband Engine Processor"
arch=(i686 x86_64)
url="http://www.ibm.com/"
license=('custom:IBM Licensed Materials')
groups=('Cell Simulator')
depends=(blt perl)
optdepends=('xterm: console support')
options=(!emptydirs !strip)
source_i686=(file://systemsim-cell-3.1-25.f9.i386.rpm)
source_x86_64=(file://systemsim-cell-3.1-25.f9.x86_64.rpm)
source=(99-systemsim-cell.rules
        LICENSE
        systemsim-cell.sh)
md5sums=('e470b6ef7d042cfe4ade6180b5c45cb8'
         '37e05d5a0dc78facacf5bf2124affa3d'
         'bf46bc7b66e0aa4f3c8894a49bdbade8')
md5sums_i686=('9acd01482d3e50163119a3791bdd4503')
md5sums_x86_64=('4b069cebf26bd16cec8e768d2c68e830')

package() {
  cp -r "${srcdir}"/opt "${pkgdir}"

  for f in systemsim-cell emitter/stripstats_live; do
    sed -i 's/8\.5\.so/8.6.so/g' "${pkgdir}/opt/ibm/systemsim-cell/bin/${f}"
  done

  chmod 4755 "${pkgdir}/opt/ibm/systemsim-cell/bin/snif"

  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  cp "${srcdir}/99-systemsim-cell.rules" "${pkgdir}/usr/lib/udev/rules.d"

  mkdir -p "${pkgdir}/etc/profile.d"
  cp "${srcdir}/systemsim-cell.sh" "${pkgdir}/etc/profile.d"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
