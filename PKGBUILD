# Maintainer: nukeop <nuclear at gumblert dot tech>
# Contributor: neurognostic <neurognostic at protonmail dot com>

pkgname=nuclear-player-bin
_pkgname=${pkgname%-bin}
pkgver=0.6.48
pkgrel=1
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
sha256sums=(7de01c169e23887bb8d49e1fd96f97bb45dec7c7afe7e5f6d31b36a4a0b7d582
            SKIP)

prepare() {
    bsdtar -xJf data.tar.xz
}

package()   {
    iconDir=usr/share/icons/hicolor
    scalableDir="$iconDir/scalable/apps"
    install -dm0755 "$pkgdir/"{opt,usr}
    rm -rf "$iconDir"/*
    mkdir -p "$scalableDir"
    cp -a opt/nuclear/resources/media/presskit/icons/scalable/nuclear-icon.svg "$scalableDir"/nuclear.svg
    cp -art "$pkgdir" opt
    cp -art "$pkgdir" usr
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
    mkdir -p "$pkgdir/usr/bin/"
    ln -sf "/opt/nuclear/nuclear" "$pkgdir/usr/bin/nuclear"
}