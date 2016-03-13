# Maintainer: Charles Duffy <charles@dyfis.net>
pkgname=ns-exec-tools-git
pkgver=r6.447b31a
pkgrel=1
pkgdesc="Lightweight, execline-style tools to build restricted Linux namespaces"
arch=( any )
url="https://github.com/charles-dyfis-net/ns-exec-tools"
license=( ISC )
depends=( lxc util-linux )
conflicts=( "${pkgname%-git}" )
source=( 'ns-exec-tools::git+https://github.com/charles-dyfis-net/ns-exec-tools' )
sha1sums=( SKIP )

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() { :; }

package() {
  cd "${pkgname%-git}"
  mkdir -p \
    "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/bin"
  cp README.md "$pkgdir/usr/share/doc/$pkgname/"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  cp [[:lower:]]* "$pkgdir/usr/bin/"
}
