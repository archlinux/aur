# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=preaur-git
_repo=PreAUR
pkgver=0.0.4.r2.g00e9293
pkgrel=1
pkgdesc="PreAUR, build AUR (not only) pkgbuilds ahead of time."
arch=('any')
url="https://github.com/kobe-koto/$_repo"
license=('AGPL-3.0-only')
depends=(
  'bun'
  'git'
  'devtools'
  'base-devel'
)
provides=('preaur')
conflicts=('preaur')
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
    install -Dm755 "$srcdir/$_repo/dist/index.js" "$pkgdir/usr/bin/preaur"
}
