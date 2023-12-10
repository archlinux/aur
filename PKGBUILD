# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.13.0'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" xcp.bash)
sha512sums=('8471eebdec9f2a18c0c8d2be14ca379ff7f6701a415356823570200fc4abc1355cd712eefa228063eec69de0a1ae6cc5022db9a800a6d1a67f62f708953cf597'
            '67d2569086ac2d35f60fedb4d413a95c3af90e3c5dac56f803cdbeb68785f8ee70d18cb3c3f0dfd96bb16741fdc5f3ec6c39583a2611ab9f3d49f27f227109b8')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
