# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab
# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=automake-1.7
_pkgname=automake
pkgver=1.7.9
pkgrel=1
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=('any')
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
makedepends=('autoconf')
provides=("automake=1.7")
options=(!emptydirs)
install='automake.install'
source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir"/${_pkgname}-$pkgver
  ./configure --prefix=/usr
  make
}

package(){
  cd "$srcdir"/${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install

  # remove the symlinks
  rm "$pkgdir"/usr/bin/{automake,aclocal}

  # make info files version specific
  install -dm755 "$pkgdir"/usr/share/info
  mv "$pkgdir"/usr/info/${_pkgname}.info "$pkgdir"/usr/share/info/${_pkgname}-1.7.info
}
md5sums=('eb25355e3cf00aac83c580dde970a0b4')
