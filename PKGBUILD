# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=3.7.2
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
md5sums=('9dedaac5d664e829f936c0ca1b4aae68')
sha256sums=('ef491843efe54bb9696ef1cf4ededa1bb888b1bdcf83398bd19259b0526df681')

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
  install -Dm644 kcc.png $pkgdir/usr/share/pixmaps/kcc.png
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
