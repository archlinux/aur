# Maintainer: <agustinballesteros04@gmail.com>
pkgname=kew-git
pkgrel=1
pkgver=v3.6.4.e2332c1
pkgdesc="A command-line music player"
arch=('x86_64')
url="https://github.com/ravachol/kew"
license=('GPL2')
conflicts=('kew')
depends=('fftw' 'faad' 'git' 'chafa' 'taglib' 'libogg' 'gcc' 'make' 'glib2' 'opus' 'opusfile' 'libvorbis' 'curl')
replaces=('cue-git')
sha256sums=('SKIP')

source=("git+${url}")

pkgver() {
    cd "$srcdir/kew"
    local tag=$(git tag | sort | tail -n1)
    local commit_hash=$(git rev-parse --short HEAD)
    echo "${tag}.${commit_hash}" | sed 's/[:\/\-]//g'
}

build() {
    cd "$srcdir/kew"
    make
}

package() {
    cd "$srcdir/kew"
    install -Dm755 kew "$pkgdir/usr/bin/kew"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/kew/docs/kew.1" "$pkgdir/usr/share/man/man1/kew.1"
}

