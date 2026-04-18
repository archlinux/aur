# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-git
_repo=Archavenger
pkgver=0.0.2.r3.g34ab49c
pkgrel=1
pkgdesc="Archavenger is a simple tool for cleaning up Arch Linux package repositories."
arch=('any')
url="https://github.com/kobe-koto/$_repo"
license=('MIT')
makedepends=('git')
depends=(
  'bun'
)
provides=('archavenger')
conflicts=('archavenger')
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "$srcdir/$_repo"
    bun install
    bun run build
}

package() {
    install -Dm755 "$srcdir/$_repo/dist/index.js" "$pkgdir/usr/bin/archavenger"
}
