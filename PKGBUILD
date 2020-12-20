# Maintainer: Jan Wójcicki <jantap413 at gmail dot com>

_pkgname=rsmixer
pkgname=${_pkgname}-git
pkgver=0.2.4.r13.geb77ee7
pkgrel=1
pkgdesc='CLI volume control for PulseAudio'
arch=('i686' 'x86_64')
url="https://github.com/jantap/rsmixer"
license=('MIT')
depends=('pulseaudio')
makedepends=('rust' 'git')
provides=('rsmixer')
conflicts=('rsmixer')
source=("git+https://github.com/jantap/rsmixer.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd $_pkgname
    cargo build --locked --release
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
}
