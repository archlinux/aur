# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=git-ftp
pkgver=1.0.2
pkgrel=1
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('ruby-ronn')
source=(https://github.com/git-ftp/git-ftp/archive/$pkgver.tar.gz
        git-ftp-0.9.0-Replace-pandoc-with-ronn.patch)
md5sums=('bb48c82f402a643fa117d209b377db76'
         '12463b49d14f3133bed635002a33fa68')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../git-ftp-0.9.0-Replace-pandoc-with-ronn.patch
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install-all

  cd "$pkgdir"
  install -d usr/share/
  mv bin usr/
  mv man usr/share
}
