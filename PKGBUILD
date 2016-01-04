# Maintainer: Jason Edson <jason@oceighty.co>

_pkgname=meld
pkgname=$_pkgname-git
pkgver=3.15.1.23.00b37a6
pkgrel=1
_realver=3.15.1
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('python2'
        'gtk3>=3.6'
	'glib2>=2.34'
	'python2-gobject>=3.6'
	'pygobject-devel>=3.6'
	'gtksourceview3>=3.6')
makedepends=('intltool' 'gnome-doc-utils' 'git' 'itstool')
optdepends=('python2-dbus: open a new tab in an already running instance'
            'python2-gconf: gnome integration')
replaces=('meld')
provides=("meld=${_realver}")
conflicts=('meld-dev')
install=meld.install
options=('!emptydirs')
source=("git://git.gnome.org/meld")
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
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py \
  	--no-update-icon-cache --no-compile-schemas install \
  	--prefix=/usr \
  	--root="${pkgdir}" \
  	--optimize=1
}
