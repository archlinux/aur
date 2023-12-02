# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Harsh Barsaiyan <hbarsaiyan at gmail dot com>
pkgname=youtube-music-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('gtk3' 'libsecret' 'nss')
makedepends=('setconf')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("https://github.com/th-ch/youtube-music/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb"
        "https://github.com/th-ch/youtube-music/raw/v$pkgver/license"
        "${pkgname%-bin}.sh")
sha256sums=('84a78cbdaf04ff27897f8a942ef65e35491a51765207965d9172c69562630545'
            'e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')

package(){
  bsdtar xfv data.tar.xz -C "$pkgdir"

  setconf "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop" Exec "${pkgname%-bin} %U"

  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
