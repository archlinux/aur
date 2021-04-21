# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Tomas Kral <tomas.kral@gmail.com>

pkgname=rememberthemilk
pkgver=1.3.5
pkgrel=1
pkgdesc="The smart to-do app for busy people."
arch=('x86_64')
url="https://www.rememberthemilk.com"
license=('custom:none' 'MIT' 'Apache')
source=("https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk_${pkgver}_amd64.deb")
sha256sums=('ca6f2a84a2239b74d00a5c09eef1ae30b54b6758138a5253ec48f24133785037')

prepare() {
  cd ${srcdir}
  bsdtar -xf data.tar.xz
}

package() {
  depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-atk libutil-linux libappindicator-gtk3 libsecret)
  cp -r ${srcdir}/opt ${pkgdir}
  cp -r ${srcdir}/usr ${pkgdir}

  # add symlink to usr/bin
  mkdir -p ${pkgdir}/usr/bin
  ln -s "/opt/RememberTheMilk/rememberthemilk" ${pkgdir}/usr/bin

  # Install licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/opt/RememberTheMilk"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}
