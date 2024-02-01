# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.1.31
pkgrel=1

source=("https://github.com/giantpinkrobots/varia/archive/refs/tags/v$pkgver.tar.gz")
        
sha256sums=('17bc239eb754512b14bd71ba65668661626ed0de6052ff3da2508f3cb5ede8e2')

pkgdesc='Download manager based on aria2'
arch=('any')
url='https://github.com/giantpinkrobots/varia'
license=('MPL2')
depends=('aria2' 'aria2p' 'python' 'python-setuptools')
makedepends=('meson')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  meson setup builddir
  cd builddir
  meson compile
}

package() {
  cd "$srcdir/$pkgname-$pkgver/builddir"
  meson configure -Dprefix="/usr"
  meson install --destdir "$pkgdir"
  chmod -R 755 "$pkgdir"
  
  # Install license
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
