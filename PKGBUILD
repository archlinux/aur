# Maintainer:  jjpk <julienjpk@email.com>
# Contributor: Benjamin Chrétien <chretien at lirmm dot fr>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gereon Schomber <Gereon_Schomber@fastmail.fm>
# Contributor: Alex Belanger <i.caught.air@gmail.com>

pkgname=ace
pkgver=6.4.1
pkgrel=1
pkgdesc="Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems."
url="http://www.dre.vanderbilt.edu/~schmidt/ACE.html"
license=('custom')
arch=('i686' 'x86_64')
depends=()
options=(!libtool)
conflicts=('libace')
source=("http://download.dre.vanderbilt.edu/previous_versions/ACE-${pkgver}.tar.gz"
        "license.txt")
sha256sums=('bc51ffcc6c68f9a244def11a92c6843e789349538b997529c7942629641379ce'
            '4aef434f0bc8c91488f92b25863e5dcbff857598389276718c59903cd8c8c954')

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
