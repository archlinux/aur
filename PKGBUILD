pkgname="linphone-git"
_basename="linphone"
pkgver=3.7.0.r1376.gbe7413c
pkgrel=1
pkgdesc="Linphone is an internet phone or Voice Over IP phone (VoIP)."
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('GPL2')
depends=('gtk2' 'mediastreamer-git' 'libexosip2' 'belle-sip-git')
makedepends=('git')
options=(!libtool)
provides=("${_basename}")
conflicts=("${_basename}")
source=("git://git.${_basename}.org/${_basename}.git")
sha256sums=('SKIP')

prepare() {
  cd "$_basename"
  mkdir -p oRTP mediastreamer2
  touch oRTP/autogen.sh mediastreamer2/autogen.sh
  chmod +x oRTP/autogen.sh mediastreamer2/autogen.sh

  ./autogen.sh
}

build() {
  cd "$_basename"
  ./configure --prefix=/usr --enable-external-ortp --enable-external-mediastreamer
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
