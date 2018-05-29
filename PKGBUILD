# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_ver=2.5.0
pkgname=macports-base
pkgver=${_ver/-/}
pkgrel=1
epoch=1
pkgdesc='The MacPorts command-line client'
url='https://www.macports.org/'
arch=('i686' 'x86_64')
license=('BSD')
# man is used for `port help`
depends=('curl' 'man' 'nmtree' 'openssl' 'sqlite')
# tcl: MacPorts comes with its own vendored tclsh, while a system interpreter
# is still needed to build tcllib
# rsync: ./configure checks for `rsync` in $PATH and saves the value in
# macports_autoconf.tcl, so this should be in makedepends, too
makedepends=('tcl' 'rsync')
optdepends=(
    'rsync: for syncing sources via rsync'
)
source=("https://github.com/macports/macports-base/releases/download/v$_ver/MacPorts-$_ver.tar.bz2"{,.asc})
sha256sums=('361d2230ee8f6bb6dc9bf5d2f7a72371c67f596c71a203c56635b730fe057083'
            'SKIP')
validpgpkeys=(
    'C403793657236DCF2E580C0201FF673FB4AAE6CD'
)
backup=(opt/local/etc/macports/archive_sites.conf
        opt/local/etc/macports/macports.conf
        opt/local/etc/macports/pubkeys.conf
        opt/local/etc/macports/sources.conf
        opt/local/etc/macports/variants.conf)

build() {
  cd "MacPorts-$_ver"

  ./configure --enable-readline
  make
}

package() {
  cd "MacPorts-$_ver"
  make DESTDIR="$pkgdir" install

  install -Ddm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
