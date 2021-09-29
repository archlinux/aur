# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_name="pyrenamer"
pkgname="python2-${_name}"
pkgver=0.6.1
pkgrel=3
pkgdesc="Application for mass renaming files."
provides=("${_name}")
conflicts=("${_name}")
arch=('any')
url="https://gitlab.com/patlefort/${_name}"
license=('GPL2')
depends=('python2' 'pygtk' 'python2-gconf')
makedepends=()
options=(!buildflags)
_dir="${_name}-v${pkgver}"
source=("https://gitlab.com/patlefort/${_name}/-/archive/v${pkgver}/${_dir}.tar.gz")
sha256sums=('81f11fa7ab6f874407009327b683b5f9ef402deaddea357c6fbd6dc770cc4b81')

#prepare() {
	#cd "${_dir}"
	#sed -r -i 's/#!\/app\/bin\/python/#!\/usr\/bin\/python2/' "src/pyrenamer"
	#sed -r -i 's/eyeD3/eyed3/' "src/pyrenamer_globals.py.in"
	#sed -r -i 's/eyeD3/eyed3/' "src/pyrenamer_filefuncs.py"
#}

build() {
  cd "${_dir}"
  ./configure PYTHON=python2 --prefix=/usr --sysconfdir=/etc \
		--with-gconf-schema-file-dir=/usr/share/gconf/schemas
	make
}

package() {
  cd "${_dir}"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
