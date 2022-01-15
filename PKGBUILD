# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=git-gone
pkgver=0.3.8
pkgrel=1
pkgdesc='Prune stale local Git branches'
arch=('i686' 'x86_64')
url="https://codeberg.org/flausch/git-gone"
license=('Apache')
depends=('git' 'libgit2')
conflicts=('git-gone-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('5bd958ea26c0ea5fd94da7f2b035927b')
sha1sums=('b7db56f92c71ba22a54127113a3e4205bd4f5c96')
sha512sums=('dfe624aebc376062c43856a975f0e1a607b1046e77f544e398a3f67277ad402df7f0514cbec9c808a1c80028e1bc412cdfc664de476b1d33f927cdfde9c5282c')

build() {
  cd "$pkgname"

  LIBGIT2_SYS_USE_PKG_CONFIG=1 cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/git-gone.1" "$pkgdir/usr/share/man/man1/git-gone.1"
}
