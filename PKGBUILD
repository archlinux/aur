# Maintainer: quomoow <quomoow@gmail.com>
# Submitter: quomoow <quomoow@gmail.com>
pkgname=libfm-gtk2-git
_pkgname=libfm
pkgver=1.2.4.r13.ga1b16b6
pkgrel=4
pkgdesc="Core library of PCManFM file manager"
arch=('i686' 'x86_64')
url="https://github.com/lxde/libfm"
license=('GPL')
depends=('intltool>=0.40' 'glib2>=2.22' 'gtk2>=2.18' 
'menu-cache-git>=0.3.2' 'libexif')
makedepends=('git' 'libtool' 'vala')
optdepends=('gtk-doc-tools>=1.14' 'dbus-glib' 'libexif-gtk')
conflicts=('libfm-qt-git' 'libfm-gtk3' 'libfm-gtk2' 'libfm-gtk3-git')
provides=('libfm-gtk2' 'libfm-gtk2-git')
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

