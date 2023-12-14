# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.15.0'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	xcp.bash
	xcp.fish)
sha512sums=('82f12c636a289981316f4d48a9660be647a39fdee1e477e01b7008396924fab8ab37f26fdf24c44839a3f72f20c85fafd1bce385dbbc6424c8a642879846aabc'
            '67d2569086ac2d35f60fedb4d413a95c3af90e3c5dac56f803cdbeb68785f8ee70d18cb3c3f0dfd96bb16741fdc5f3ec6c39583a2611ab9f3d49f27f227109b8'
            '2c4d671d8c976e9936b9abd710eb4f26a8ed901d9e0e585caeb10c855fccac4516d5f1460bfa9c0f9ee3b0e84c3009c99a4463ec594f605d7fb615cdcb240080')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # completions
  install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
