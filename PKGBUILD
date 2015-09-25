# Maintainer: Joao Sa <me@joaomsa.com>

pkgname=powermonius-git
_gitname="powermonius"
_gourl="github.com/joaomsa/powermonius"
pkgver=r20.01e1d82
pkgrel=1
pkgdesc="Be parsimonius with power consumption. Run only what you need when on battery."
arch=('x86_64' 'i686')
url="https://github.com/joaomsa/powermonius"
license=('MIT')
depends=('upower')
makedepends=('git' 'go')
source=("git://github.com/joaomsa/powermonius")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.* COPYING.*; do
      if [ -e "$srcdir/src/$_gourl/$f" ]; then
        install -Dm644 "$srcdir/src/$_gourl/$f" \
          "$pkgdir/usr/share/licenses/$_gitname/$f"
      fi
    done
}

# vim:set ts=2 sw=2 et:
