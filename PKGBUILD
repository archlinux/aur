# Maintainer: vetu104 <janne.p.w.vetelainen@gmail.com>
# Contributor: Viste <viste02@gmail.com> 
# Contributor: alrii <alrii@gmail.com> 
# Contributor: jjpk <julienjpk@email.com>
# Contributor: Benjamin Chrétien <chretien at lirmm dot fr>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gereon Schomber <Gereon_Schomber@fastmail.fm>
# Contributor: Alex Belanger <i.caught.air@gmail.com>

pkgname=ace
_pkgver=7_1_3
pkgver=7.1.3
pkgrel=1
pkgdesc="Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems."
url="https://www.dre.vanderbilt.edu/~schmidt/ACE.html"
license=('custom')
arch=('i686' 'x86_64')
depends=()
options=(!libtool)
conflicts=('libace')
source=("https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${_pkgver}/ACE-${pkgver}.tar.gz")
sha256sums=('4cb82d8daf83f3abe50ac460b4fac9a8da2512f08d8efb4d327dcacd0b3929b3')

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
