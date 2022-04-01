# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=sane-frontends
pkgver=1.0.14
pkgrel=9
pkgdesc="A set of frontends for SANE."
arch=(x86_64)
url="http://www.sane-project.org"
license=('GPL')
depends=('sane' 'gimp' 'libjpeg')
source=("https://alioth-archive.debian.org/releases/sane/sane-frontends/${pkgver}/sane-frontends-${pkgver}.tar.gz" MissingCapsFlag.patch)
md5sums=('c63bf7b0bb5f530cf3c08715db721cd3' '770f66e0534953f6129e1fc03d88ae01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../MissingCapsFlag.patch
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
