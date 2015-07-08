# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=ostree
pkgver=2015.7
pkgrel=1
pkgdesc='a tool for managing bootable, immutable, versioned filesystem trees'
arch=('i686' 'x86_64')
url='http://live.gnome.org/OSTree'
license=('GPL2')
depends=('libgsystem' 'libsoup' 'libarchive' 'gpgme')
makedepends=('git' 'gtk-doc')
_libglnxrev='900b25f'
_bsdiffrev='1edf9f656850c0c64dae260960fabd8249ea9c60'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz"
	"git://github.com/GNOME/libglnx.git#commit=${_libglnxrev}"
	"git://github.com/mendsley/bsdiff.git#commit=${_bsdiffrev}")
sha256sums=('7bfac5c5394fbe618f27f66eb3ed8e8d3365be3d4f27440af6119ef241ce6326'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cp -r ../libglnx/* libglnx/
  cp -r ../bsdiff/* bsdiff/
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr  \
  	       --sbindir=/usr/bin \
  	       --libexecdir=/usr/lib \
  	       --sysconfdir=/etc \
  	       --with-systemdsystemunitdir=/usr/lib/systemd/system \
  	       --with-mkinitcpio
  make
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

}

