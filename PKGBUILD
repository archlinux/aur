# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: robertfoster

_pkgname=akabeicore
pkgname=$_pkgname-git
pkgver=alpha2.r168.g925966a
pkgrel=1
pkgdesc="Core library for Akabei, Chakra’s package manager"
arch=('i686' 'x86_64')
url="https://code.chakralinux.org/chakra/akabei/akabeicore"
license=('GPL2')
depends=('kdelibs' 'libarchive' 'sqlite3')
makedepends=('cmake' 'automoc4' 'translate-toolkit' 'git')
source=("akabeicore::git+https://code.chakralinux.org/chakra/akabei/akabeicore.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/akabeicore"
  # cutting off 'akabeicore_' prefix that presents in the git tag
  git describe --long | sed 's/^akabeicore_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/akabeicore"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr 
  make || return 1
}

package() {
  cd "$srcdir/akabeicore"
  make DESTDIR="$pkgdir" install
}
