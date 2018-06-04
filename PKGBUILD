# Maintainer: Jason Edson <jason@oceighty.co>

_pkgname=meld
pkgname=$_pkgname-dev
pkgver=3.19.0
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=(GPL)
arch=(any)
conflicts=('meld' 'meld-git')
replaces=('meld' 'meld-git')
provides=('meld')
makedepends=('intltool' 'gnome-doc-utils' 'itstool')
install=meld.install
depends=('python>=3.3'
        'gtk3>=3.6'
	'glib2>=2.36'
	'python-gobject>=3.14'
	'pygobject-devel>=3.14'
	'gtksourceview3>=3.14'
        'python-cairo>=1.10.0-6')
optdepends=('python2-dbus: open a new tab in an already running instance')
source=("https://download.gnome.org/sources/$_pkgname/${pkgver%.*}/meld-${pkgver}.tar.xz")
sha1sums=('14e425a276e45518a18f63d9668c50c9b928ddf5')

prepare() {
  cd $_pkgname-$pkgver
}

build() {
  cd $_pkgname-$pkgver
  python3 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  # using --skip-build breaks install
  python3 setup.py --no-update-icon-cache --no-compile-schemas \
    install --prefix=/usr --root="$pkgdir" --optimize=1
}
