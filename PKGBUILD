# Maintainer: Bash Booster <Booster.sdk@gmail.com>
# Contributor: Riccardo Berto <riccardobrt@gmail.com>
# Contributor: vbmithr
# Contributor: Flamelab <panosfilip at gmail dot com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=xf86-video-ati-git
_realpkgname=xf86-video-ati
pkgver=7.8.0.r4.g13c6bc5
pkgrel=1
pkgdesc="X.org ati video driver. Git version"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
provides=("${_realpkgname}")
depends=('libdrm' 'systemd' 'mesa')
makedepends=('xorg-server-devel>=1.18')
conflicts=('xorg-server' 'xf86-video-ati')
license=('custom')
install=xf86-video-ati-git.install
source=('xf86-video-ati::git://anongit.freedesktop.org/xorg/driver/xf86-video-ati')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/xf86-video-ati"
  ( set -o pipefail
  git describe --long | sed 's/^xf86-video-ati-//;s/\([^-]*-g\)/r\1/;s/-/./g'
  )
}

build() {
  cd "${srcdir}/xf86-video-ati"

  ./autogen.sh --prefix=/usr \
    --enable-glamor
  make
}

package() {
  cd "${srcdir}/xf86-video-ati"

  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
