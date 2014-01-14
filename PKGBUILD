# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=3.7.1
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python2' 'python2-pillow' 'python2-pyqt4' 'python2-psutil')
makedepends=('zip')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('d0310f59a87267b9c2a1cc45fc7e2c93')
sha256sums=('d97f8fe18b6cf57bbfacc73994dafe62fee81a48de5c372ecbef8fd71528090b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh setup.sh

  [[ -d "$srcdir/build" ]] && rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  tar -xf KindleComicConverter_linux_$pkgver.tar.gz -C "$srcdir/build"
}

package() {
  cd "$srcdir/build"
  install -Dm755 kcc $pkgdir/usr/bin/kcc
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
