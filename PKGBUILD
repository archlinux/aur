# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=4.3.1
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python' 'python-pillow' 'python-psutil' 'python-pyqt5' 'python-slugify')
makedepends=('zip')
optdepends=(
  'kindlegen: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('75a73708f3a624bb4f44a7e61673b26a')
sha256sums=('b3cab29fa17d06e84b16981d66e792b8060b738462cacfdce485984e8ae81be3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh setup.sh

  [[ -d "$srcdir/build" ]] && rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  tar -xf KindleComicConverter_linux_$pkgver.tar.gz -C "$srcdir/build"
}

package() {
  cd "$srcdir/build"
  for bin in kcc kcc-c2e kcc-c2p; do
    install -Dm755 $bin $pkgdir/usr/bin/$bin
  done
  install -Dm644 kcc.png $pkgdir/usr/share/pixmaps/kcc.png
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
