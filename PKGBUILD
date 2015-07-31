# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gereon Schomber <Gereon_Schomber@fastmail.fm>
# Contributor: Alex Belanger <i.caught.air@gmail.com>

pkgname=ace
pkgver=6.3.1
pkgrel=1
pkgdesc="Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems."
url="http://www.cs.wustl.edu/~schmidt/ACE.html"
license=('custom')
arch=('i686' 'x86_64')
depends=()
options=(!libtool)
conflicts=('libace')
source=(http://download.dre.vanderbilt.edu/previous_versions/ACE-${pkgver}.tar.gz
        license.txt)

build() {
  export ACE_ROOT=$srcdir/ACE_wrappers
  cd $ACE_ROOT
  echo '#include "ace/config-linux.h"' > ace/config.h
  echo 'INSTALL_PREFIX = /usr
  include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU' > include/makeinclude/platform_macros.GNU
  cd ace
  make
}
package() {
  cd $srcdir/ACE_wrappers/ace
  make DESTDIR="$pkgdir/" install
}
sha1sums=('6b1256b259b699f9e6747bc3b53b48885e18a4af'
          'b21054d0aa546fabe4bb0c2769401314d4a5bfe3')
