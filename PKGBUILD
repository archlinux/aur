# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jarek Sedlacek <JarekSedlacek@gmail.com>
# Contributor: Erdbeerkaese <erdbeerkaese underscore arch at gmail dot com>

pkgname=sparkleshare
_pkgname=SparkleShare
pkgver=2.0.0
pkgrel=1
pkgdesc="Collaboration and sharing tool based on git written in C Sharp"
arch=('any')
url="http://sparkleshare.org/"
license=('GPL3')
depends=('webkit2-sharp' 'notify-sharp-3' 'curl' 'git' 'openssh' 'gvfs')
makedepends=(git)
_commit=b4b741b1d06f0eabc80d1927588328b928ee3d11  # tags/2.0.0
source=("git+https://github.com/hbons/SparkleShare.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd SparkleShare
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd SparkleShare
  # Fix build
  sed -i 's/"org.sparkleshare.SparkleShare", new string \[0\]/0, null/' SparkleShare/Linux/UserInterface.cs
}

build() {
  cd SparkleShare
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd SparkleShare
  make DESTDIR="$pkgdir" install
}
