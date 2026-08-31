# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot
pkgver=0.9.0
pkgrel=1
pkgdesc='Simple and handy definitions-based snapshoting tool for BTRFS'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Edu4rdSHL/rusnapshot'
license=(MIT)
depends=('sqlite' 'btrfs-progs')
makedepends=('cargo')
conflicts=("$pkgname-git")
provides=("$pkgname")
source=("${pkgname}-${pkgver}::https://github.com/Edu4rdSHL/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c372b6d5bcb3c80c2da6ccc9997058a807a41c01db951adacdbbf4161bb4e58f157ad6075c62c4c3c85698d29d878fd433fa2c9b4436ba980d67efc485fcf5e7')

build() {
  cd ${pkgname}-${pkgver}

  cargo build --release --locked
}

check() {
  cd ${pkgname}-${pkgver}

  cargo test --release --locked
}

package() {
  cd ${pkgname}-${pkgver}

  install -dm 755 "${pkgdir}/etc/$pkgname"

  install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/$pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  cp -R examples/* -t "$pkgdir/usr/share/doc/$pkgname"
}

