# Maintainer: doonoo <your-email@example.com>
#
# AUR package of a released version of Strait Bible. The "-git" package in ../PKGBUILD builds the latest commit.

pkgname=straitbible
pkgver=6.4
pkgrel=1
pkgdesc='Free multilingual Bible reader (based on Unbound Bible)'
arch=('x86_64')
url='https://github.com/doonoo/straitbible'
license=('GPL3')
depends=('gtk2' 'sqlite' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus')
conflicts=('straitbible-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'zeoslib::git+https://github.com/marsupilami79/zeoslib.git#branch=7.2.14-stable')
sha256sums=('c985f41eaeb39ffc950499342e7f1eee311df6e1c62a223bfad2f3a47383ca19'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh packaging/build-linux.sh "$srcdir/zeoslib"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sh packaging/install-linux.sh "$pkgdir" /usr
}
