# Maintainer: <agustinballesteros04@gmail.com>
pkgname=cue-git
pkgver=1.1.0.r4.g43c964c
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/cue"
license=('GPL')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage')
conflicts=('cue')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/cue"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/cue"
    make
}

package() {
    cd "$srcdir/cue"
    install -Dm755 cue "$pkgdir/usr/bin/cue"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/cue/docs/cue-manpage.mdoc" "$pkgdir/usr/share/man/man1/cue.1"
}

