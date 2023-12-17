# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.15.2'
pkgrel=2
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	xcp.bash
	xcp.fish
	xcp.zsh)
sha512sums=('d0666ce98d5f825180ff2b909e84cb499c75284cf52b7cb924c4ea5d36edfce5d068fdebb1d9d0eed3b1d7c0353e3e00b4cdc5c7807a23825f2314bd7bf8e418'
            '67d2569086ac2d35f60fedb4d413a95c3af90e3c5dac56f803cdbeb68785f8ee70d18cb3c3f0dfd96bb16741fdc5f3ec6c39583a2611ab9f3d49f27f227109b8'
            'c1cf458d19fad085ad9c0dbb11c3d65ae405c5008b7eec637635f673c98d833f0d66eee9a8708501f98a20f1c261fdc440e2bd7a1c1f766b8bb57f9107cd3e2b'
            'c7e46901ec0ad564c4b64dc344a30dc38ce9ff167a31cae75e49626773376aed2a10e9193c6e34d0fcce1fa323a632ee8c049325bf97a4cdf7e6feae58e303e8')

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
  install -Dm644 "$srcdir/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$srcdir/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
