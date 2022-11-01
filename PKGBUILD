# Maintainer : Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor : Jo De Boeck <deboeck.jo@gmail.com>

_pkgname=koditools
pkgname=$_pkgname-git
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('xbmctools-git')
pkgver=1.2.r15.g8f6cf3e
pkgrel=1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url='https://github.com/grimpy/koditools'
depends=('python')
makedepends=('python-distribute' 'git')
optdepends=('nginx: For sending media to kodi')

source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
