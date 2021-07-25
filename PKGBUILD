# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=rerun
pkgver=1.4.1
pkgrel=1
pkgdesc="Take your shell scripts and turn them into powerful full featured management utilities with no extra programming."
arch=('any')
depends=('bash' 'discount' 'python2-pygments')
url="https://rerun.github.io/rerun/"
license=('Apache')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/rerun/$pkgname/tar.gz/v$pkgver)
sha256sums=('07557f1e3b9f0d94f5cee3aa9bb82ba688769806d9fd59a60713a57a7adcb727')
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
