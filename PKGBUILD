# Maintainer: Atnanasi <ys2000pro@gmail.com>
pkgname=mkrepo
pkgver=0.1.0
pkgrel=1
pkgdesc='Create repo directory for ghq style'
arch=('i686' 'x86_64')
url='https://github.com/himanoa/mkrepo'
license=('MIT')
depends=('git')
makedepends=('rust')
optdepends=('ghq')
source=("https://github.com/himanoa/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d04c20368d8640756a96e91cf2c1fd8c')
install=$pkgname.install

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  cargo install --root "${pkgdir}/usr" --path '.'
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # cargo make .crates.toml. At this time, cargo cannot provides --no-metadata option.
  rm "${pkgdir}/usr/.crates.toml"
}
