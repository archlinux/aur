# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot
pkgver=0.10.1
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
sha512sums=('7bf181ec7252c56f440f3d25ed709a15bd04bb1e7c2fa125b183b2c1c3874f27d6d17822588986c6737fe865844f832e63b7215a6c88ef8d6bdd3cc1655a3a17')

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

