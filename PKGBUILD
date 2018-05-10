# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=macports-base
pkgver=2.5.0_beta1
pkgrel=1
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
source=("https://github.com/macports/macports-base/releases/download/v${pkgver/_/-}/MacPorts-${pkgver/_/-}.tar.bz2"{,.asc})
sha256sums=('6cb15500d60c72e5356933a9db8de2bd037ec93a88873ce1ded0c900fd7d6caa'
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
  cd "MacPorts-${pkgver/_/-}"

  ./configure --enable-readline
  make
}

package() {
  cd "MacPorts-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install

  install -Ddm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
