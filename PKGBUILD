# Maintainer: Jason Edson <jason@oceighty.co>

_pkgname=meld
pkgname=$_pkgname-git
pkgver=3.19.1.6.g23b6fea8
pkgrel=1
_realver=3.19.1
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('python>=3.3'
        'gtk3>=3.6'
	'glib2>=2.36'
	'python-gobject>=3.14'
	'pygobject-devel>=3.14'
	'gtksourceview3>=3.14'
        'python-cairo>=1.10.0-6')
makedepends=('intltool' 'gnome-doc-utils' 'git' 'itstool')
optdepends=('python-dbus: open a new tab in an already running instance')
conflicts=('meld' 'meld-dev')
provides=('meld')
install=meld.install
options=('!emptydirs')
source=("git+https://github.com/GNOME/meld.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python3 setup.py \
  	--no-update-icon-cache --no-compile-schemas install \
  	--prefix=/usr \
  	--root="${pkgdir}" \
  	--optimize=1
}
