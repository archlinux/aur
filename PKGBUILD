# Maintainer: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=ugene
pkgver=1.17.0
pkgrel=2
pkgdesc="A free cross-platform genome analysis suite."
arch=('i686' 'x86_64')
url="http://ugene.unipro.ru/"
license=('GPL')
depends=('qt4' 'libxtst' 'glu' 'qtwebkit' 'desktop-file-utils' 'procps-ng' 'python' 'shared-mime-info')
source=(${url}downloads/$pkgname-$pkgver.tar.gz)
sha1sums=('5b88783dbd1552daa40f0acb3182d261ccc10ea4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ $CARCH == "i686" ]]
  then
    qmake-qt4 PREFIX=/usr -r
  elif [[ $CARCH == "x86_64" ]]
  then
    qmake-qt4 CONFIG+=x64 PREFIX=/usr -r
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

