# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=ostree
pkgver=2016.5
pkgrel=1
pkgdesc='a tool for managing bootable, immutable, versioned filesystem trees'
arch=('i686' 'x86_64')
url='http://live.gnome.org/OSTree'
license=('GPL2')
depends=('libgsystem' 'libsoup' 'libarchive' 'gpgme' 'fuse' 'libutil-linux')
makedepends=('git' 'gtk-doc')
_libglnxrev='7695227'
_bsdiffrev='1edf9f6'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz"
	"git://github.com/GNOME/libglnx.git#commit=${_libglnxrev}"
	"git://github.com/mendsley/bsdiff.git#commit=${_bsdiffrev}")
sha256sums=('bc904544f1127e16bc9d76893a5a8149feeda080b84d071b549a1bcf3e29dd0f'
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

#  make check
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

}

