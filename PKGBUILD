# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ekg
pkgver=1.8rc2
pkgrel=2
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
md5sums=('f697c711da91ddf57c882114539e92fe')
sha1sums=('e6efb2eae35170ac7d5e1c7419b646457f128dfd')

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

# vim:set ts=2 sw=2 et:
