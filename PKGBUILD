# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot
pkgver=0.5.2
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
sha512sums=('9fc41e473fde517de6c44f03564e33f7d55e5bf8fe1891d96e7dda3e39c2397e9b89e9dde964af8e58b67894abab06f2d47c4782529cf5551fa43ca182af1470')

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

