# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=flexisip
pkgver=1.0.12
pkgrel=1
pkgdesc="A general purpose SIP proxy with media capabilities"
arch=('x86_64')
url="http://flexisip.org"
license=('AGPL3')
groups=()
depends=('belle-sip-git' 'belr' 'hiredis' 'mediastreamer-git' 'ortp-git' 'protobuf' 'soci' 'sofia-sip-bc' 'unixodbc' 'xsd')
makedepends=('cmake' 'git')
install='flexisip.install'
source=("git+https://github.com/BelleDonneCommunications/$pkgname.git")
noextract=()
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DENABLE_REDIS=YES \
        -DENABLE_PROTOBUF=YES \
        -DENABLE_PRESENCE=YES .
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm0644 "scripts/flexisip.service" "$pkgdir/usr/lib/systemd/system/flexisip.service"
  install -Dm0644 "scripts/flexisip-presence.service" "$pkgdir/usr/lib/systemd/system/flexisip.service"
}
