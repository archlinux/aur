# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pd-touchosc-git
pkgver=44.443c793
pkgrel=2
pkgdesc="A TouchOSC MIDI bridge for Pd"
arch=("i686" "x86_64")
license=('BSD')
url="https://bitbucket.org/agraef/pd-touchosc/"
depends=('pd' 'pd-pure' 'pure-avahi' 'pure-stldict' 'pure-xml')
# Apparently these went missing during the AUR4 migration. So you need to make
# sure that you have at least the cyclone and mrpeach externals installed.
optdepends=('pd-cyclone' 'pd-net-svn' 'pd-osc')
makedepends=()
source=("git+https://bitbucket.org/agraef/pd-touchosc" "touchosc-bridge.pd")
md5sums=(SKIP 'cb9610c709b04f595ee6869bac362edd')

pkgver() {
  cd $srcdir/pd-touchosc
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
     cd $srcdir/pd-touchosc
     make prefix=/usr
}

package() {
     # Reformatted version of the patch which looks nicer in vanilla Pd.
     cp touchosc-bridge.pd $srcdir/pd-touchosc/examples
     cd $srcdir/pd-touchosc
     make DESTDIR=$pkgdir prefix=/usr install
}
