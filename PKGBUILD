# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot
pkgver=0.6.0
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
sha512sums=('06a871d63831076765531d006c4cb6d25da74213aa75b6e1a5403e52172b45ea3a5832aae65aa4ab8745b649bf26e3d8bc0dcc7d01a69f4ad056a471ee69b934')

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

