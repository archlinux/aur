# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: codestation <codestation404@gmail.com>

pkgname=vitamtpmod-git
pkgver=v2.5.6.6.ge98d0ec
pkgrel=1
pkgdesc="Library to interact with Vita's USB MTP protocol (fork) (GIT version"
arch=("i686" "x86_64")
url="https://github.com/codestation/VitaMTP"
license=('GPL')
depends=('libusb' 'libxml2')
provides=('vitamtpmod')
conflicts=('vitamtpmod')
source=('vitamtp::git+https://github.com/codestation/VitaMTP.git')
sha1sums=('SKIP')

pkgver() {
  cd vitamtp
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd vitamtp
  ./autogen.sh
}

build() {
  cd vitamtp
  ./configure --prefix=/usr
  make
}

package() {
  cd vitamtp
  make DESTDIR="${pkgdir}" install
  install -Dm644 debian/libvitamtp4.udev "$pkgdir/usr/lib/udev/rules.d/80-psvita.rules"
}
