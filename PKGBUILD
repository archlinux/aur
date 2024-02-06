# Maintainer: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2024.2.6
pkgrel=1

source=("https://github.com/giantpinkrobots/varia/archive/refs/tags/v$pkgver.tar.gz")
        
sha256sums=('e58954f584c46a5ac87a755f154808cc5bca32c2454415e9111dc3630e00a3c3')

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
