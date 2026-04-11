# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-git
_repo=Archavenger
pkgver=0.0.1.r2.g8b99055
pkgrel=1
pkgdesc="Archavenger is a simple tool for cleaning up Arch Linux package repositories."
arch=('any')
url="https://github.com/kobe-koto/$_repo"
license=('AGPL-3.0-only')
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
