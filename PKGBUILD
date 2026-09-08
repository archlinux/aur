#Maintainer: Amro Emad <korialo001 at gmail dot com>

pkgname=mpv-twitch-chat-git
_pkgname=${pkgname%-git}
pkgver=r38.72d97a0
pkgrel=1
pkgdesc='Show Twitch chat messages as subtitles when watching Twitch VOD with mpv.'
arch=('any')
url="https://github.com/CrendKing/mpv-twitch-chat"
license=('MIT')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=(
      'mpv'
      'curl')

    cd "$_pkgname"

    install -Dm 644 "main.lua" -t "${pkgdir}/etc/mpv/scripts/${pkgname}/"
    install -Dm 644 "README.md" "screenshot.webp" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm 644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
