# Maintainer: Antony Ho <ntonyworkshop@gmail.com>
pkgname=ibus-cangjie
pkgver=2.4
pkgrel=1
pkgdesc="This is an IBus engine for users of the Cangjie and Quick input methods."
arch=('x86_64' 'i686')
url="http://cangjians.github.io/projects/ibus-cangjie/"
license=('GPL3')
depends=('ibus>=1.4.1' 'python-pycangjie>=1.0' 'python>=3.2' 'python-gobject')
conflicts=()
makedepends=('intltool' 'dconf')
replaces=('ibus-cangjie-git')
install='ibus-cangjie.install'
sha512sums=('cef9562fc4a5f3b78881c09b43e502f02322148e501022d3f80989caef4ca98ae26903e9a3dcc422feeba7712a8321c731ba229429e52fe919db5144aa0ead47')
source=("https://github.com/Cangjians/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")


check () {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
