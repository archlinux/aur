# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ekg
pkgver=20190803
pkgrel=1
pkgdesc="A Gadu-Gadu compatible client."
arch=('i686' 'x86_64')
url="http://ekg.chmurka.net/"
license=('GPLv2')
groups=()
depends=('libjpeg' 'aspell' 'python2' 'giflib' 'libgadu')
makedepends=()
checkdepends=()
optdepends=()
provides=('ekg')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ekg.chmurka.net/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('5aeb3f4dd62161ce9c76d5a8f5458a31')
sha1sums=('4e5c60ea92028db7adedf2b4d2bc9830801201e7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's#gg%s#ekg%s#' src/ekg.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="$CFLAGS -lX11" ./configure --prefix=/usr \
                                     --enable-aspell \
                                     --enable-ui-readline \
                                     --with-pthread \
                                     --with-python
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

