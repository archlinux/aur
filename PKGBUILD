# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.17.0'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2b05507216ce58199c5897a32321c7d30a3b77a131ad4f709121cf5fd5d4eda20e4d471d45478a1252d2a299f664a1460a110113e38ffaa83170ee59fda40adf')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  ./tests/scripts/test-linux.sh
}

package() {
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname-$pkgver/completions"
  install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
