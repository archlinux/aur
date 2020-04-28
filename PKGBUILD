# Maintainer: Noel Kuntze <noel@familie-kuntze.de>

# This is now a git package, as the developers don't provide a tarball for the 0.71 release.

pkgname=pev-git
pkgver=r602.ccef80d
pkgrel=1
pkgdesc='Command line based tool for PE32/PE32+ file analysis'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
conflicts=('pev')
makedepends=('unzip')
depends=('glibc' 'openssl' 'pcre')
source=('pev-git::git+https://github.com/merces/pev')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/pev-git"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  make prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}"
  make prefix=/usr "DESTDIR=${pkgdir}" install
}
