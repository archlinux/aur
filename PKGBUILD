# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.3.2
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('d705b0c9c20108a186b214596437d373081d34ed53fc87fcec08dc7954532715')

# Dependencies listed in deb file that are satisfied by other dependencies: gtk3 libxtst at-spi2-atk libutil-linux
# Dependencies listed in deb file that are not satisfied by other dependencies
depends=(libnotify nss libxss xdg-utils libappindicator-gtk3 libsecret)

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
