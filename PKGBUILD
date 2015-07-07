# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <dasimmet@gmail.com>
pkgname=libucl-git
_gitname=libucl
pkgver=0.7.3.r113.g20b1288
pkgrel=1
pkgdesc="BSD's Universal Config Language - git version"
arch=('x86' 'x86_64' 'armv7')
url="https://github.com/vstakhov/"
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=('libucl')
replaces=()
backup=()
options=()
source=(git+https://github.com/vstakhov/libucl.git)
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc 
	make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
