pkgname=apt-dater-legacy
_pkgname=apt-dater
pkgver=0.9.0
pkgrel=3
pkgdesc="Terminal-based remote package update manager, legacy version with original text based configuration"
arch=('i686' 'x86_64')
url="https://www.ibh.de/apt-dater"
license=('GPL')
conflicts=('apt-dater')
depends=('glib2' 'libxml2' 'lockfile-progs' 'ncurses' 'openssh' 'perl' 'popt' 'tcl' 'tmux' 'util-linux' 'screen')
makedepends=('pkg-config' 'vim')
source=("https://github.com/DE-IBH/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1c361dd686d66473b27db4af8d241d520535c5d5a33f42a35943bf4e16c13f47')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export CFLAGS=${CFLAGS/-O2/-O0}
  ./configure \
    --prefix=/usr \
	--disable-rpath \
	--enable-debug \
	--enable-xmlreport \
	--enable-autoref \
	--enable-history \
	--enable-clusters \
	--enable-tclfilter \
	--enable-tmux
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
