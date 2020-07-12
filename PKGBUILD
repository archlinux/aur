# Maintainer: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
# Contributor: Ivan Naydonov <samogot@gmail.com>
pkgname=ricoh-spc260series-sane
pkgver=1.01
pkgrel=1

pkgdesc="SANE driver for Ricoh SP C260 series"
arch=('x86_64')
url="https://support.ricoh.com/bb/html/dr_ut_e/rc3/model/spc261sfnw/spc261sfnw.htm"
license=('unknown')
depends=('sane')
makedepends=('binutils')

install='ricoh-spc260series-sane.install'
source=(https://support.ricoh.com/bb/pub_e/dr_ut_e/0001305/0001305285/V101/r80956en.exe)
md5sums=('5be6f1e3409d2a5678a706aeacbf1e43')

_backend_name=sp_c260series
_mysanelib=libsane-${_backend_name}.so.${pkgver}.0

prepare() {
  ar x sp-c260series_Scanner-$pkgver-amd64.deb
  tar -zxf data.tar.gz
  ln -s /usr/lib/sane/$_mysanelib usr/lib/sane/libsane-${_backend_name}.so
  ln -s /usr/lib/sane/$_mysanelib usr/lib/sane/libsane-${_backend_name}.so.1
}

package() {
  install -d $pkgdir/usr
  install -d $pkgdir/etc
  cp -a usr etc $pkgdir
}
