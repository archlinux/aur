pkgname=mediastreamer-git
_basename="mediastreamer2"
pkgver=2.10.0.r880.g7f2055c
pkgrel=1
pkgdesc="Mediastreamer2 is a GPL licensed library to make audio and video real-time streaming and processing."
arch=('i686' 'x86_64')
url="http://www.linphone.org/"
license=('GPL')
options=(!libtool)
depends=('gsm' 'v4l-utils' 'ffmpeg' 'libxv' 'ortp-git' 'speex')
makedepends=('git' 'cmake' 'automoc4' 'intltool')
optdepends=('mediastreamer-plugin-msamr-git: amr plugin' 'mediastreamer-plugin-msx264-git: x264 plugin')
source=("git://git.linphone.org/$_basename.git")
sha256sums=('SKIP')

provides=("mediastreamer")
conflicts=("mediastreamer")

prepare() {
  cd "$_basename"
  ./autogen.sh
}

build() {
  cd "$_basename"
  ./configure --prefix=/usr --enable-external-ortp --libexecdir=/usr/lib/mediastreamer/
  make
}

package() {
  cd "$_basename"
  make DESTDIR=$pkgdir install
}

pkgver() {
 cd "$_basename"
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
