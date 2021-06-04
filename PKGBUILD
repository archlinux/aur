# Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
pkgname=sad
pkgver=0.4.7
pkgrel=1
pkgdesc="Space Age seD"
arch=("x86_64")
url="https://github.com/ms-jpq/sad"
license=('MIT')
makedepends=('rust')
depends=('gcc-libs')
optdepends=('fzf: for tui usage'
            'diff-so-fancy: diff colourizer'
            'git-delta-git: diff colourizer')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ms-jpq/${pkgname}/archive/${pkgver}.tar.gz"
  "lockfile.patch")
sha256sums=('241d6161a1f26323a2cb07774db95b47df794e8bdcd7254905f6971be7def987'
            '571cd53cfe3b4a9af3356067f00347f96f599146274c9f7ec65d89d070fb062e')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../lockfile.patch
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release  --all-features

}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sts=2 sw=2 et :
