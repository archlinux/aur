# Maintainer: Faustino Aguilar <faustinoaq.github.io>
pkgname=amber
pkgver=0.1.8
pkgrel=1
pkgdesc="Amber framework that makes interfacing with your file system and applications much smoother. (Work In Progress)"
arch=(i686 x86_64)
url='https://github.com/amber-crystal/amber'
license=(MIT)
depends=('crystal' 'shards')
source=("https://github.com/amber-crystal/amber/archive/v$pkgver.tar.gz")
sha256sums=('0ea5bc999e80b37d34d493d64e8e37ae5e0e3526aa38e8c1898336741c706b0d')

build() {
  cd "amber-$pkgver"
  shards
  mkdir -p bin
  make build
  crystal eval 'STDIN.blocking = true'
}

package() {
  cd "amber-$pkgver"
  install -Dm755 bin/amber "$pkgdir/usr/bin/amber"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/amber/LICENSE
}
