# Maintainer: Nikola Pavlica <pavlica.nikola@gmail.com>
# Maintainer: Michael Mansell <michael.mansell@gmail.com>
# Maintainer: Gosha Tugai [SAL9000] <gosha.tugai@gmail.com>
# Contributor: Ross Melin <rdmelin@gmail.com>

# 1.1-2 : Updated autogen.sh.patch to handle newer versions of automake.
# 1.1-4 : Updated and corrected the PKGBUILD to a newer format and changed the repository

pkgname=gimp-plugin-deskew-git
_pkgname=gimp-deskew-plugin
pkgver=1.1
pkgrel=4
pkgdesc="Auto straighten lines of text in scanned documents"
arch=('x86_64')
#(old old) url="http://www.cubewano.org/gimp-deskew-plugin/"
#(old) url="https://github.com/prokoudine/gimp-deskew-plugin"
url="https://github.com/gimp-plugins-justice/gimp-deskew-plugin"
license=('GPL')
depends=('gimp')
makedepends=('git' 'gcc' 'automake' 'autoconf' 'intltool' 'gettext')
provides=('gimp-plugin-deskew')
conflicts=('gimp-plugin-deskew')
source=('autogen.patch'
		'git+https://github.com/gimp-plugins-justice/gimp-deskew-plugin')
sha256sums=('b64799de98d8089790752d35ad8b1b1c5bc387a725b21cf2bd08589b26258b58'
			'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  msg "Patching autogen.sh for autoconf-1.12"
  patch -u -F5 -N autogen.sh ../autogen.patch
  ./autogen.sh --prefix=/usr
}

build() {
  cd "$srcdir/$_pkgname"
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

