# Maintainer: Ying Stokes <yingstokes@gmail.com>

pkgname=alass-git
_gitname=alass
pkgver=2.0.0.r2
pkgrel=1
pkgdesc="Command line tool to synchronize subtitles"
arch=('x86_64')
url="https://github.com/kaegi/alass"
license=('GPL3')
depends=('ffmpeg')
makedepends=('git' 'cargo')
provides=('alass')
conflicts=('alass')
source=("git+https://github.com/kaegi/alass")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$_gitname"
        git describe --long --tag | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/^v//;s/-/.r/'
}

build() {
        cd "$srcdir/$_gitname"
        cargo build --release
}

package() {
        cd "$srcdir/$_gitname"
        install -Dm 755 target/release/alass-cli "${pkgdir}/usr/bin/alass"
}
