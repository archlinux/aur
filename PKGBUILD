# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Simo Leone <simo@archlinux.org>

pkgname=habak
pkgver=0.2.5
pkgrel=7
pkgdesc="A background changing app"
url="https://sourceforge.net/projects/fvwm-crystal/"
license=('GPL2')
depends=('imlib2')
source=("http://archive.debian.org/debian/pool/main/h/habak/habak_$pkgver.orig.tar.gz")
arch=('x86_64')
options=('!makeflags')
md5sums=('6c1410a16a57d3483c41fad6ed2f6f49')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|^\(LDFLAGS.*$\)|\1 -lX11|' src/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export LDFLAGS=${LDFLAGS/,--sort-common,--as-needed//}
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m755 -D habak "$pkgdir/usr/bin/habak"
}
