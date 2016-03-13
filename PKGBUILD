# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=twelf-git
pkgver=20130819
pkgrel=1
pkgdesc='An implementation of the logical framework LF'
url='http://twelf.org/'
license=('BSD')
arch=('i686' 'x86_64')
depends=('bash' 'gmp')
makedepends=('mlton')
provides=('twelf')
conflicts=('twelf')
install=$pkgname.install
source=("${pkgname}::git://github.com/standardml/twelf.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"
  make mlton
}

package() {
  cd "$pkgname"
  install -d -m755 $pkgdir/opt/twelf $pkgdir/usr/bin
  cp -r . $pkgdir/opt/twelf
  ln -s /opt/twelf/bin/twelf-server $pkgdir/usr/bin/twelf-server
}
