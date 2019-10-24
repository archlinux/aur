# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.1.15
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('47353c8f201373b8d2a473b5fbd9ad9f55fce87f5872a40fdea51a080d2b1b1b')
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
  ln -s "/opt/Remember The Milk/rememberthemilk" ${pkgdir}/usr/bin

  # Install licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/opt/Remember The Milk"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
