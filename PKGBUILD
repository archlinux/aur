# Maintainer: Térence Clastres <t.clastres@gmail.com>
# Maintainer: Robin Broda <robin@broda.me>
# Contributor: X0rg
# Contributor: marlock <marlock87@hotmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=psensor-git
pkgver=v1.2.0.r72.gabf3533
pkgrel=1
pkgdesc='A graphical hardware temperature monitor for Linux'
arch=('x86_64')
url='https://gitlab.com/jeanfi/psensor'
license=('GPL2')
depends=('lm_sensors' 'dconf' 'gtk3' 'udisks2' 'curl' 'libgtop' 'libnotify'
         'libxnvctrl' 'json-c' 'libmicrohttpd')
makedepends=('git' 'help2man')
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$pkgname"

  autoreconf -i

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="${pkgdir}/" install
}
