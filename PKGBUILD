# Maintainer: gomanager <gomanager@generated>
pkgname=gosuki
pkgver=1.3.0
pkgrel=2
pkgdesc="A lightweight, open-source, privacy-first bookmark manager that unifies your bookmarks across multiple browsers, syncs them in real time (locally or P2P), requires no extensions, and stores everything locally."
arch=('x86_64' 'aarch64')
url="https://github.com/blob42/gosuki"
license=('AGPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/blob42/gosuki.git#tag=v$_pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    ./cmd/gosuki
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
