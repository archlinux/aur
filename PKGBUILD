# Maintainer: Jan-Jaap Korpershoek <jjkorpershoek96 at gmail dot com>
pkgname=batch
pkgver=r18.f306c54
pkgrel=1
pkgdesc="A command-line program for batch processing of files using your favorite text editor"
arch=('any')
url="https://github.com/alexherbo2/batch"
license=('Unlicense')
makedepends=(
    'shards'
    'git'
)
source=('git+https://github.com/alexherbo2/batch.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make build
}

package() {
    cd "$pkgname"
    bindir="$pkgdir/usr/bin"
    sharedir="$pkgdir/usr/share/$pkgname"
	mkdir -p "$sharedir" "$bindir"
	install -Dm755 "${PWD}/bin/batch" "$bindir/batch_process"
	install -Dm755 "${PWD}/scripts/rename" "${PWD}/scripts/convert" "${PWD}/scripts/relink" "$sharedir"
}
