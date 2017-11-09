# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Shamelessly copied from https://aur.archlinux.org/packages/mtree/
pkgname=mtree-git
pkgver=r27.4f3e901
pkgrel=2
pkgdesc="Map a directory hierarchy"
arch=( 'i686' 'x86_64' )
url="https://github.com/archiecobbs/mtree-port"
license=( 'custom' )
depends=( 'openssl' )
makedepends=( 'openssl' )
_pkgname=mtree
conflicts=( 'mtree' )
provides=('mtree')
install=
changelog=
noextract=()
source=("mtree::git+https://github.com/archiecobbs/mtree-port.git")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}
package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm755 mtree   "${pkgdir}"/usr/bin/mtree
	# the mtree.5 conflicts with libarchive that already installs mtree.5
	install -Dm644 mtree.8 "${pkgdir}"/usr/share/man/man8/mtree.8
	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}
