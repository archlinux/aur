# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
pkgname=advancescan
pkgver=2.0
_git_hash=bd6babdaa72dacba8ec3b1afcb72a36dbaa57823
pkgrel=1
pkgdesc='A command line rom manager for AdvanceMAME, AdvanceMESS and any other MAME derivative'
arch=('i686' 'x86_64')
url='http://www.advancemame.it/scan-readme.html'
license=('GPL')
source=("https://github.com/amadvance/${pkgname}/archive/${_git_hash}.zip")
sha256sums=('dd6adb7c87376284c74d7a3bba865a0703adc8e41c46d648d520529ea5e7cdc3')

build() {
  cd $srcdir/$pkgname-$_git_hash
  autoreconf -i || return 1
  ./configure --prefix=/usr || return 1
  make all || return 1
}

package() {
  cd $srcdir/$pkgname-$_git_hash
  # Binaries
  install -D -m755 advscan $pkgdir/usr/bin/advscan
  install -D -m755 advdiff $pkgdir/usr/bin/advdiff
  # Documentation
  install -D -m644 doc/advscan.1 $pkgdir/usr/share/man/man1/advscan.1
  install -D -m644 doc/advdiff.1 $pkgdir/usr/share/man/man1/advdiff.1
}
