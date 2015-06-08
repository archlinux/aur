# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=volumeicon-git
pkgver=0.r46.9e3755f
pkgrel=2
pkgdesc='Volume control for your system tray'
arch=('x86_64' 'i686')
url="http://softwarebakery.com/maato/volumeicon.html"
license=('GPL3')
depends=('gtk3' 'alsa-lib' 'libnotify' 'intltool')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/Maato/volumeicon.git')
md5sums=('SKIP')

conflicts=('volumeicon')
replaces=('volumeicon')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr --enable-notify
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
}
