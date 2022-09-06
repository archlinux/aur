# Maintainer: Juanjo Gutierrez <juanjo at gutierrezdequevedo dot com>

pkgname=lxrad
pkgver=0.8.9
pkgrel=3
pkgdesc="linux x11 rad tools"
arch=('x86_64' 'aarch64')
url='https://github.com/lcgamboa/lxrad'
license=('GPL2')
makedepends=('doxygen'
             'openal'
             'wxwidgets-gtk3')
depends=('lunasvg')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
    '0001-use-systems-lunasvg.patch')
sha256sums=('63c89cc3253823c20aaaf38543eb5682362b76b187cef86a725e23343ba8b77f'
            'a2d3583ca4865393382de5298cfe8f0fcba0aafc76cfbfdb9fbcadb8887722c3')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < ../0001-use-systems-lunasvg.patch
}

build() {
  cd "$pkgname-$pkgver"

  autoupdate
  autoreconf --install

  ./configure --prefix=/usr
  make all
  make -C layout
}

package() {
  cd "$pkgname-$pkgver"

  install -d -m 755 "$pkgdir/usr/lib"
  install -d -m 755 "$pkgdir/usr/bin"

  make install prefix="$pkgdir/usr"
  make install prefix="$pkgdir/usr" -C layout
}
