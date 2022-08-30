# Maintainer: Jason Gerecke <killertofu@gmail.com>
# Contributor: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Jonas Jelten <jonas.jelten@gmail.com>

pkgname=mtview-git
pkgver=20160918
pkgrel=1
pkgdesc="Multitouch event viewer."
arch=('i686' 'x86_64')
url="https://github.com/whot/mtview"
license=('GPL3')
depends=('mtdev>=1.1' 'evemu>=1.0.10' 'libxi' 'cairo')
optdepends=(
    'xmlto: build manpages'
    'asciidoc: build manpages'
)
makedepends=('git')
provides=('mtview')
conflicts=('mtview')
options=('!libtool')
source=("$pkgname"::git+https://github.com/whot/mtview.git#branch=master)
md5sums=('SKIP')

pkgver() {
  # Original version scheme was YYYYMMDD; continue to use
  cd "$srcdir/$pkgname"
  date -d "@$(git log -1 --format=%ct)" "+%Y%m%d"  
}

build() {
  cd "$srcdir/$pkgname"
  
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

