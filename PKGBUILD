# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
pkgver=1.2
pkgrel=2
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit-sharp' 'notify-sharp' 'curl' 'git' 'openssh' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
install=$pkgname.install
source=(https://bitbucket.org/hbons/sparkleshare/downloads/$pkgname-linux-$pkgver.tar.gz
        https://github.com/hbons/SparkleShare/commit/ba72a7a30.patch)
md5sums=('befc1542079b0fc6e4b57fa7fdfab12e'
         'b9a7fbcf0375331bc1eea5a43cb4a119')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix crash when we can't get the username
  patch -Np1 -i ../ba72a7a30.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-appindicator
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
