# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: dragonn <dragonn at op dot pl>

pkgname=tkgate-beta
pkgver=2.0_b10
pkgrel=2
license=('GPL')
pkgdesc="A digital circuit simulator with a tcl/tk-based graphical editor. Beta version"
depends=('tcl' 'tk' 'libsm')
conflicts=('tkgate')
url="http://www.tkgate.org"
arch=('i686' 'x86_64')
source=("http://pkgs.fedoraproject.org/repo/pkgs/tkgate/tkgate-${pkgver//_/-}.tar.gz/84ffe959868d39ec856b5ff1c70136c3/tkgate-${pkgver//_/-}.tar.gz")
md5sums=('84ffe959868d39ec856b5ff1c70136c3')

build() {
  cd ${srcdir}/tkgate-${pkgver//_/-}
  CPPFLAGS='-DUSE_INTERP_RESULT' LDFLAGS='-lm' ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/tkgate-${pkgver//_/-}
  make DESTDIR=${pkgdir} install
  ln -sf /usr/bin/verga ${pkgdir}/usr/share/tkgate/libexec/verga
  ln -sf /usr/bin/tkgate ${pkgdir}/usr/share/tkgate/libexec/tkgate
}
