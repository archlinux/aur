# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>

pkgname=rusnapshot
pkgver=0.5.3
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
sha512sums=('76aa86f3bdc373f219e51472334555ae96596d278dd0477f0ae4a3b3007825a5cd7d3f71cca7b1a4de66138975d01ec2250a2903e7c7dd447a1c6ab08c1ea51a')

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

