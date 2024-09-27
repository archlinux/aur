# Maintainer: <agustinballesteros04@gmail.com>
pkgname=kew-git
pkgrel=1
pkgver=v2.8.2.90f5f14
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
conflicts=('kew')
depends=('ffmpeg' 'fftw' 'git' 'chafa' 'freeimage' 'gcc' 'make' 'glib2' 'opus' 'opusfile' 'libvorbis')
optdepends=('libnotify')
replaces=('cue-git')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/kew"
    local tag=$(git tag | sort | tail -n1)
    local commit_hash=$(git rev-parse --short HEAD)
    echo "${tag}.${commit_hash}"
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
