# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.3.3
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('c96fbc1fa030cee28ecb1abe71f09fb49a61b63f71a353e51ca4bc0a50cd941d')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-atk libutil-linux libappindicator-gtk3 libsecret)

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
