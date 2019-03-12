#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=socnetv
_reponame=app
pkgver=2.5
pkgrel=1
pkgdesc="Social Networks Analysis and Visualisation"
arch=('any')
url="http://socnetv.sourceforge.net/"
license=('GPL3')
depends=('qt5-base' 'qt5-charts' 'qt5-svg')
provides=('socnetv')
conflicts=('socnetv-git')
source=(https://github.com/$pkgname/app/archive/v$pkgver.tar.gz)
sha256sums=('ea70e4ef5d654624ab5d503f050ab9fc1ebaf02dfd917eb9713b0b9050dc4332')

build() {
  cd "${srcdir}/$_reponame-$pkgver"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/$_reponame-$pkgver"
  install -d "$pkgdir/usr/share/socnetv/"
  install -D socnetv "$pkgdir/usr/bin/socnetv"
  install -D socnetv.desktop "$pkgdir/usr/share/applications/socnetv.desktop"
  install -D socnetv.appdata.xml "$pkgdir/usr/share/metainfo/socnetv.appdata.xml"
  install -D "src/images/socnetv.png" "$pkgdir/usr/share/pixmaps/socnetv.png"
  install -D "man/socnetv.1.gz" "$pkgdir/usr/share/man/man1/socnetv.1.gz"

  cp -r translations/ "$pkgdir/usr/share/socnetv/"
}
