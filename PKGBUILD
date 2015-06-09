# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rerun
pkgver=1.1.1
pkgrel=1
pkgdesc="Turn your favorite shell scripts into modular automation with standardized options handling, command line completion, documentation generation, and a built-in test framework"
arch=('any')
depends=('bash' 'discount' 'python2-pygments')
makedepends=('autoconf' 'make')
url="https://rerun.github.io/rerun/"
license=('Apache')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/rerun/$pkgname/tar.gz/v$pkgver)
sha256sums=('6afef26be4430f47ae9bb574f16a79ac4b3bf0d49f26033733e4748c770e2cb9')
install=rerun.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Installing bash completion...'
  install -Dm 644 etc/bash_completion.sh "$pkgdir/usr/share/bash-completion/completions/rerun"
  rm -rf "$pkgdir/usr/etc"
}
