# Maintainer: Logeek <awesomelogix at gmail dot com>

pkgname=bombsquad-bin
pkgver=latest
_version=$(curl -sL "https://files.ballistica.net/bombsquad/builds/CHANGELOG.md" | grep -oP '^### \K\d+\.\d+\.\d+' | head -n 1)
pkgrel=1
pkgdesc='An explosive arcade-style party game'
arch=('x86_64' 'aarch64')
url='https://github.com/efroemling/ballistica/'
license=('custom')
depends=(
    'sdl2'
    'libglvnd'
    'libvorbis'
    'glibc'
    'python'
    'gcc'
    'openal'
    'python-yaml'
    'python-psutil'
)
source=(
    "icon.png::https://files.ballistica.net/bombsquad/promo/BombSquadIcon.png"
    'bombsquad.desktop'
)

source_aarch64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Linux_Arm64_${_version}.tar.gz")
source_x86_64=("https://files.ballistica.net/bombsquad/builds/BombSquad_Linux_x86_64_${_version}.tar.gz")

sha256sums=(
    '31f3af8d59a384b7a3ac999d2e8fe0a0033d0d31ae6e760686537ab85d86ba00'
    'e37368d94f87cb231f59c86eeac723d76ab64a911fb8c07cfc0d377ed75b5249')

sha1sums_aarch64=($(curl -s "https://tools.ballistica.net/builds" | grep -oE '[0-9a-f]{40}' | sed -n '2p'))
sha1sums_x86_64=($(curl -s "https://tools.ballistica.net/builds" | grep -oE '[0-9a-f]{40}' | sed -n '3p'))

pkgver() {
    echo "$_version"
}

package() {
    install -dm755 "$pkgdir/opt/"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/{pixmaps,applications}"
    install -dm755 "$pkgdir/usr/bin/"

    cp -r "$srcdir/BombSquad_Linux_x86_64_${_version}"/* "$pkgdir/opt/$pkgname"

    ln -s "$pkgdir/opt/$pkgname/bombsquad" "$pkgdir/usr/bin/bombsquad"

    install -Dm644 "$srcdir/bombsquad.desktop" "$pkgdir/usr/share/applications/bombsquad.desktop"
    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/bombsquad.png"
}
