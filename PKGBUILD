# Maintainer: <agustinballesteros04@gmail.com>
pkgname=kew-git
pkgver=v1.10.r0.gde1d1b2
pkgrel=1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
conflicts=('kew')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage' 'gcc' 'make' 'glib2' 'opus' 'opusfile' 'libvorbis')
replaces=('cue-git')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/kew"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/kew"
    make
}

package() {
    cd "$srcdir/kew"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/kew/docs/kew-manpage.mdoc" "$pkgdir/usr/share/man/man1/kew.1"
}

