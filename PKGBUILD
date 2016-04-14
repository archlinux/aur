# Maintainer: Jens Staal <staal1978@gmail.com>
# Contributor: talavis <aur talavis eu>
# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=ugene
pkgver=1.22.0
pkgrel=1
pkgdesc="A free cross-platform genome analysis suite."
arch=('i686' 'x86_64')
url="http://ugene.net/"
license=('GPL')
depends=('qt5-base' 'libxtst' 'glu' 'qtwebkit' 'desktop-file-utils' 'procps-ng' 'python' 'shared-mime-info'
'qt5-svg' 'qt5-script')
source=("${url}downloads/$pkgname-$pkgver.tar.gz" 'hmmer3.patch')
sha256sums=('ee46be799c9f02a9b6a89f13747a4918d5c96c01676dc2d4cc4a4c98278912b6'
            '57ecbaec5b5d26382d06b73ad0d599f7b07237de6ebf1e175fe662884e585736')
install=$pkgname.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/hmmer3.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ $CARCH == "i686" ]]
  then
    qmake-qt5 PREFIX=/usr -r
  elif [[ $CARCH == "x86_64" ]]
  then
    qmake-qt5 CONFIG+=x64 PREFIX=/usr -r
  fi
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}

