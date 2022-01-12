# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Ian Brunelli (brunelli) <ianbrunelli@gmail.com>

_appname='gnome-news'
pkgname="${_appname}-git"
pkgver='r316.f958219'
pkgrel=1
pkgdesc='A GNOME 3 Feed Reader'
arch=('any')
license=('GPL3')
url="https://gitlab.gnome.org/GNOME/${_appname}"
depends=('glib2' 'gtk3' 'python' 'python-gobject' 'tracker>=1.5.1'
         'webkit2gtk')
makedepends=('appstream-glib' 'autoconf' 'autoconf-archive' 'automake' 'git'
             'intltool')
options=('!emptydirs')
install='gnome-news.install'
source=("git+https://gitlab.gnome.org/GNOME/${_appname}.git")
sha256sums=('SKIP')
conflicts=('gnome-news')
provides=("gnome-news=${pkgver}")

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_appname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install
}
