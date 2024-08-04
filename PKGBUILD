# Maintainer: nukeop <nuclear at gumblert dot tech>
# Contributor: neurognostic <neurognostic at protonmail dot com>

pkgname=nuclear-player-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.33
pkgrel=3
pkgdesc='A free, multiplatform music player app that streams from multiple sources.'
arch=(x86_64)
url='http://nuclear.js.org'
provides=($_pkgname)
license=('AGPL-3.0-only')
depends=(libnotify libappindicator-gtk3 libxtst nss)
source=(
    https://github.com/nukeop/nuclear/releases/download/v$pkgver/nuclear-v$pkgver-amd64.deb
    https://raw.githubusercontent.com/nukeop/nuclear/v$pkgver/LICENSE
)
sha256sums=(9ec3098c629caca902dae1a77480e01d0b5d53b62159c023bfb7810b89e36b52
            SKIP)

prepare() {
    bsdtar -xJf data.tar.xz
}

package()   {
    install -dm0755 "$pkgdir/"{opt,usr}
    cp -art "$pkgdir" opt
    cp -art "$pkgdir" usr
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
    mkdir -p "$pkgdir/usr/bin/"
    ln -sf "/opt/nuclear/nuclear" "$pkgdir/usr/bin/nuclear"
}