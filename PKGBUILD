# Maintainer: Sofia Lima <me [at] dzshn [dot] xyz>
pkgname=vencord-desktop-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A standalone Electron app that loads Discord & Vencord (official binary version)"
arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Desktop"
license=('GPL')

depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vencord")
conflicts=("vencord")

source=("https://github.com/Vencord/Desktop/releases/download/v${pkgver}/VencordDesktop-${pkgver}.tar.gz"
        "https://github.com/Vencord/Desktop/raw/main/static/icon.png"
        "https://github.com/Vencord/Desktop/raw/main/LICENSE"
        "vencord.desktop")

sha256sums=('be10e3d8285260bc67c216b01d72a0e88c81bf30ee29b5ac93fa4001fa3797ab'
            '12d47c6612624b51a597ef6b042d1d03d67bc50247524444aa416666b203f920'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'cd4d39fb009bfee33709c26c010a8fe70a76ee3c00006e822da2fec692a165d5')

package() {
  cd "$srcdir"

  install -d ${pkgdir}/opt/vencord
  cp -r VencordDesktop-${pkgver}/. ${pkgdir}/opt/vencord

  install -Dm 644 vencord.desktop ${pkgdir}/usr/share/applications/vencord.desktop
  install -Dm 644 icon.png ${pkgdir}/usr/share/pixmaps/vencord.png
  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  install -d ${pkgdir}/usr/bin
  ln -s /opt/vencord/vencorddesktop ${pkgdir}/usr/bin/vencord
}
