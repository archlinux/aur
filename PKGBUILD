pkgname=eolie-git
_gitname=eolie
pkgver=0.1.r1.ge5a7d6f
pkgrel=1
pkgdesc='Web browser for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/gnumdk/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-dbus' 'python-gobject' 'python-cairo' 'libsecret' 'webkit2gtk' 'python-cryptography', 'python-crypto')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')
optdepends=('python-wikipedia: display advanced artist information')
options=('!emptydirs')
source=("git+https://github.com/gnumdk/${_gitname}.git")
sha1sums=('SKIP')
conflicts=('eolie')
provides=("eolie=$pkgver")

pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
        export LDFLAGS=""
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}
