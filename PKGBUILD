# Maintainer: Noel Kuntze <noel@familie-kuntze.de>

# This is now a git package, as the developers don't provide a tarball for the 0.71 release.

pkgname=pev-git
pkgver=r507.a6d4b19
pkgrel=1
pkgdesc='Command line based tool for PE32/PE32+ file analysis'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
makedepends=('unzip')
depends=('glibc' 'openssl' 'pcre')
source=('pev-git::git+https://github.com/thermi/pev'
	'libpe-git::git+https://github.com/thermi/libpe'
)
md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rmdir "${srcdir}/pev-git/lib/libpe"
	mv "${srcdir}/libpe-git" "${srcdir}/pev-git/lib/libpe"
}

build() {
  cd "${srcdir}/${pkgname}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR=${pkgdir}/usr install
}
