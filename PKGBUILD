# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.1.17
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('26747c72b8d507ef86523172121a27e612519c4108f44b1286e44958e957e393')
depends=('gconf' 'gtk2' 'gtk3' 'nss')

prepare() {
  cd ${srcdir}
  bsdtar -xf data.tar.xz
}

package() {
  cp -r ${srcdir}/opt ${pkgdir}
  cp -r ${srcdir}/usr ${pkgdir}

  # add symlink to usr/bin
  mkdir -p ${pkgdir}/usr/bin
  ln -s "/opt/RememberTheMilk/rememberthemilk" ${pkgdir}/usr/bin

  # Install licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/opt/RememberTheMilk"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
