# Maintainer: Jason Edson <jason@oceighty.co>

_name=meld
pkgname=$_name-dev
pkgver=3.13.2
pkgrel=1
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('python2'
        'gtk3>=3.6'
		'glib2>=2.34'
		'pygobject-devel>=3.6'
		'gtksourceview3>=3.6')
makedepends=('intltool' 'gnome-doc-utils' 'git' 'itstool')
optdepends=('python2-dbus: open a new tab in an already running instance'
            'python2-gconf: gnome integration')
provides=($_name)
conflicts=($_name)
install=meld.install
options=('!emptydirs')
source=("http://ftp.gnome.org/pub/GNOME/sources/meld/3.13/meld-3.13.2.tar.xz")
sha256sums=('SKIP')

pkgver() {
  cd $_name-$pkgver
  git describe --tags | sed s/-/./g
}

build() {
  cd $_name-$pkgver
  python2 setup.py build
}

package() {
  cd $_name-$pkgver
  python2 setup.py \
  	--no-update-icon-cache --no-compile-schemas install \
  	--prefix=/usr \
  	--root="${pkgdir}" \
  	--optimize=1
}
