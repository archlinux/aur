# Maintainer: Petr Kracik <petrkr@petrkr.net>
pkgname=nostril-git
pkgver=r75.6d82023
pkgrel=1
arch=('x86_64')
pkgdesc="A cli util for generating nostr events"
source=("git+https://github.com/jb55/nostril.git#branch=master")
url="https://github.com/jb55/nostril"
license=('MIT')

sha256sums=("SKIP")

pkgver() {
  cd ${srcdir}/nostril
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/nostril
  make
}

package() {
  install -Dm0644 -t "$pkgdir/usr/share/man1" "nostril/doc/nostril.1"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "nostril/README.md" "nostril/CHANGELOG"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "nostril/COPYING"
  install -Dm0755 -t "$pkgdir/usr/bin/" "nostril/nostril"
  install -Dm0755 -t "$pkgdir/usr/bin/" "nostril/nostril-query"
}
