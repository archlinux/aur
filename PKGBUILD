# Maintainer: Michael Riegert <michael at eowyn net>

pkgname=ecpprog-git
pkgver=r28.2b3e8ea
pkgrel=1
pkgdesc="A basic driver for FTDI based JTAG probes to program ECP5 FPGAs"
arch=('x86_64')
url="https://github.com/gregdavill/ecpprog"
license=('ISC')
depends=('libftdi')
makedepends=('git')
provides=('ecpprog')
conflicts=('ecpprog')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (
  echo 'r'
  git rev-list HEAD --count
  echo '.'
  git rev-parse --short master
  ) | tr -d '\n'
}

build() {
  cd "$pkgname"/ecpprog
  make
}

package() {
  cd "$pkgname"/ecpprog
  DESTDIR="$pkgdir" PREFIX="/usr" make install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
