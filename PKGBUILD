# Maintainer: Rakksor <benihyniger@msn.com.com>

_gitname=xournal
_version=0.4.7
pkgname=$_gitname-gtk3-git
pkgver=0.4.7.g953b0e1
pkgrel=1
pkgdesc="Notetaking and sketching application"
arch=('x86_64' 'i686')
url="https://github.com/dmgerman/xournal"
license=('GPL2')
depends=('goocanvas' 'poppler-glib>=0.14.0' 'hicolor-icon-theme')
makedepends=('git' 'gettext')
optdepends=('ghostscript: Import PS/PDF files as bitmap backgrounds')
conflicts=('xournal' 'xournalpp-svn')
provides=('xournal')
source=("git+git://github.com/dmgerman/$_gitname.git#branch=gtk3")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
	echo $_version.g$(git rev-parse --short HEAD)
}

build() {
    cd $_gitname
    ./autogen.sh --prefix=/usr
    make
}

check() {
    cd $_gitname
    make check
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir" install desktop-install
}
