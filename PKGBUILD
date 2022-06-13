# Maintainer: Stefan Majewsky <majewsky@gmx.net>

pkgname=nerd-dictation-git
_pkgname=nerd-dictation
pkgver=0.0.r83.609b1ed474
pkgrel=1
pkgdesc='Simple, hackable offline speech to text - using the VOSK-API.'
arch=('any')
url='https://github.com/ideasman42/nerd-dictation'
license=('GPL3')
depends=('libpulse' 'python-vosk' 'xdotool') # libpulse has parec
provides=('nerd-dictation')
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    true
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m 0755 nerd-dictation "$pkgdir/usr/bin/nerd-dictation"
    for FILE in *.rst; do
        install -D -m 0644 "./$FILE" "$pkgdir/usr/share/doc/nerd-dictation/$FILE"
    done
}
