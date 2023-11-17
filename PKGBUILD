# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.12.1'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" xcp.bash)
sha512sums=('029013a7804e4ad872ec25e7d92a73b1c9a324302817c3d93def4d8182d05828a9797581867dfc936f03f73ee39502082d6fd9896f266980dcfda044fad9721b'
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
