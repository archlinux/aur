# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=git-ftp
pkgver=1.1.0
pkgrel=2
pkgdesc='Git powered FTP client written as shell script'
url='https://github.com/git-ftp/git-ftp'
arch=('any')
license=('GPL')
depends=('curl' 'git')
makedepends=('ruby-ronn')
source=("https://github.com/git-ftp/git-ftp/archive/$pkgver.tar.gz"
        "git-ftp-0.9.0-Replace-pandoc-with-ronn.patch")
sha256sums=('b0de6dc36db506ac25a6fda21cb33d37b6a0b205fc72b0bd96de87359defc837'
            '8b790a88290fce3b769a69878244c01ff519b7c2abd8b3f878fe61589cf1393e')

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
