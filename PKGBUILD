# Maintainer: Thomas Ascher <thomas.ascher@gmx.at>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>
pkgname=timemon.app
_pkgname=TimeMon
pkgrel=1
pkgver=4.2
pkgdesc="An abstract graphical representation of where your CPU cycles are going."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/timemon/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base'
         'gnustep-gui')
makedepends=('gcc-objc'
             'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.desktop")
sha256sums=('3204e7cc454db233cebb93bb7cc8ad56bf5754063ed7be1a765051615a04ec0f'
            'd899dd9da09c11f5a3910b34c1db4df85ae91307e76b12b0e27037ec1ddef314')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

post_install() {
  update-desktop-database -q
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
