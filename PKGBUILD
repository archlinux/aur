# Maintainer: nukeop <nuclear at gumblert dot tech>
# Contributor: neurognostic <neurognostic at protonmail dot com>

pkgname=nuclear-player-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.40
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
sha256sums=(f0dc74cdc2e8da8fb4fbaa60a062960c5c4fd70aa143bdb3aa453f65166a7d5d
            SKIP)

prepare() {
    bsdtar -xJf data.tar.xz
}

package()   {
    iconDir=usr/share/icons/hicolor
    scalableDir="$iconDir/scalable"
    install -dm0755 "$pkgdir/"{opt,usr}
    mv "$iconDir"/0x0 "$scalableDir"
    rm "$scalableDir"/apps/nuclear.*
    cp -a opt/nuclear/resources/media/presskit/icons/scalable/nuclear-icon.svg "$scalableDir"/apps/nuclear.svg
    cp -art "$pkgdir" opt
    cp -art "$pkgdir" usr
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
    mkdir -p "$pkgdir/usr/bin/"
    ln -sf "/opt/nuclear/nuclear" "$pkgdir/usr/bin/nuclear"
}