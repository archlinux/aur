# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Harsh Barsaiyan <hbarsaiyan at gmail dot com>
pkgname=youtube-music-bin
pkgver=1.20.0
pkgrel=3
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('gtk3' 'libsecret' 'nss')
makedepends=('setconf')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://github.com/th-ch/youtube-music/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb"
        "https://github.com/th-ch/youtube-music/raw/v$pkgver/license"
        "${pkgname%-bin}.sh")
sha256sums=('dbefcfdcab7df20be27690b9ecb0762816be61988b0371af7b2f0afb24b66494'
            'e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08'
            '08a3f1a8a20277caf3516c10c967adf7c8e3ff8a6c1ccdb53dc9794f82cae1d4')

package(){
  bsdtar xfv data.tar.xz -C "$pkgdir"

  setconf "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop" Exec "${pkgname%-bin} %U"

  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
