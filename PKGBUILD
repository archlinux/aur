# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=libnotify-id-git
_pkgname=libnotify
pkgver=0.7.6.7.g6b03c47
pkgrel=1
pkgdesc="Gnome notification library, including ID patch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://library.gnome.org/devel/libnotify/"
depends=()
makedepends=('pkgconfig' 'git' 'gobject-introspection' 'gtk-doc' 'gnome-common-git')
options=('!libtool')
conflicts=("${_pkgname}" "${_pkgname}-git")
provides=("${_pkgname}=0.7.5")
source=("git://git.gnome.org/${_pkgname}.git"
	'https://launchpadlibrarian.net/105791133/print-and-replace-id-v3.patch')
md5sums=('SKIP'
	'f75d23de7ee23e37ac36889ece359587')

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${_pkgname}"

  patch -p1 < ../../print-and-replace-id-v3.patch
  ./autogen.sh --prefix=/usr
}

build() {
  cd "${_pkgname}"

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
