# Maintainer: doonoo <your-email@example.com>
#
# AUR package of a released version of Strait Bible. The "-git" package in ../PKGBUILD builds the latest commit.

pkgname=straitbible
pkgver=6.2
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
sha256sums=('7d5005264f996c6b8f5c52641210201b2a794b3db0206879cb8624e4fa507447'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sh packaging/build-linux.sh "$srcdir/zeoslib"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sh packaging/install-linux.sh "$pkgdir" /usr
}
