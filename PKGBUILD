# Maintainer: quomoow <quomoow@gmail.com>
# Submitter: quomoow <quomoow@gmail.com>
pkgname=libfm-gtk-git
_pkgname=libfm
pkgver=a1b16b6.testing
pkgrel=1
pkgdesc="Core library of PCManFM file manager"
arch=('i686' 'x86_64')
url="https://github.com/lxde/libfm"
license=('GPLv2')
depends=('git' 'libtool' 'intltool>=0.40' 'glib2>=2.22' 'gtk2>=2.18' 
'libmenu-cache>=0.3.2')
makedepends=()
optdepends=('gtk-doc-tools>=1.14' 'dbus-glib' 'libexif-gtk')
source=(git+https://github.com/lxde/libfm)
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --always --long | sed 's/-/-r/; s/-/./g'
}

prepare() {
	cd ${_pkgname}
	./autogen.sh
}

build() {
  cd "${_pkgname}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="$pkgdir/" install
}

