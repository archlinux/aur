_pkgname="xournalpp"
pkgname="${_pkgname}-git"

pkgver=1.0.0.290.gb62f922
pkgrel=1
pkgdesc="C++ re-write of notetaking app Xournal - GIT version"
arch=('i686' 'x86_64')
url="https://github.com/xournalpp/xournalpp"
license=('GPL3')
makedepends=('git' 'cmake' 'gettext' 'boost')
depends=('gtk2' 'boost-libs' 'glib2' 'libglade' 'poppler-glib' 'glibmm')
provides=("xournal=${pkgver}" "xournal-dmgerman=${pkgver} xournalpp=${pkgver}")
conflicts=('xournal' 'xournalpp' 'xournal-dmgerman' 'xournal-image-patched' 'xournalpp-svn')
install="xournalpp.install"
source=("${_pkgname}::git+https://github.com/xournalpp/xournalpp.git#branch=string_new")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  git describe --tags | sed -e 's|v||g' -e 's|glib.||g' -e 's|-|.|g'
}

prepare() {
	
	cd "${srcdir}/${_pkgname}/"
	
	rm -rf "${srcdir}/${_pkgname}/build" || true
	mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"
	
	cmake ..
	
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
	echo
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	
	sed 's|/usr/local|/usr|g' -i "${srcdir}/${_pkgname}/build/cmake_install.cmake" || true
	make DESTDIR="${pkgdir}/" install
	echo
}
