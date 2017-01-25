# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='gtimelog'
pkgname=gtimelog-collabora-nokeyring-git
pkgver=r326.b2aa134
pkgrel=1
pkgdesc="A time tracking application: Collabora repository. Patched to remove gnomekeyring"
provides=('gtimelog')
arch=('i686' 'x86_64')
url="https://git.collabora.co.uk/cgit/gtimelog.git"
license=('GPL2')
depends=('libsoup' 'python2' 'python2-gobject')
makedepends=('git' 'python2' 'python2-setuptools')
source=("$_pkgbase::git+https://git.collabora.co.uk/cgit/gtimelog.git"
        'nokeyring.patch')
sha256sums=('SKIP'
            '7550c70300659a387a900ed0ee80dd3afafc8f655284b02e9cf46dced9a99227')

pkgver() {
	cd "$srcdir/$_pkgbase"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  patch -p1 < $srcdir/nokeyring.patch
}

build() {
	cd "$srcdir/$_pkgbase"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root="$pkgdir/"
}
