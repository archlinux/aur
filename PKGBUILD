# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=1.5
_pkgver=1.5.0
pkgrel=2
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkitgtk-sharp' 'notify-sharp-3' 'curl' 'git' 'openssh')
source=(https://bitbucket.org/hbons/sparkleshare/downloads/$pkgname-linux-$pkgver.tar.gz
        fix-build.patch)
md5sums=('1363d86129d7ce5adc1b2f02aaf3402f'
         'e940815cf3a666af0cc8e366bc4513ea')

prepare() {
  cd $pkgname-$_pkgver
  patch -Np1 -i ../fix-build.patch
}

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
}
