# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
_pkgname=SparkleShare
pkgver=1.5
_gitrev=325bc848afe460911d596eff1e09a4d39cd0b638
pkgrel=3
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit2-sharp' 'notify-sharp-3' 'curl' 'git' 'openssh')
source=("$pkgname-$_gitrev.tar.gz::https://codeload.github.com/hbons/$pkgname/tar.gz/$_gitrev"
        fix-build.patch)
sha256sums=('SKIP'
            'a88575667a5e8ffcce8ed2437033df23202fb0ec76db9b1fd43d27b0e9205057')

prepare() {
  cd $_pkgname-$_gitrev
  patch -Np1 -i ../fix-build.patch
}

build() {
  cd $_pkgname-$_gitrev
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $_pkgname-$_gitrev
  make DESTDIR="$pkgdir" install
}
