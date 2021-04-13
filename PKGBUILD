# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=intel-undervolt-git
_pkgname=intel-undervolt
pkgver=1.7.r0.gea0e74c
pkgrel=1
pkgdesc='Intel CPU undervolting tool'
arch=('x86_64')
url='https://github.com/kitsunyan/intel-undervolt'
license=('GPL3')
depends=('glibc')
makedepens=('git')
conflict=('intel-undervolt')
provides=('intel-undervolt')
backup=(etc/intel-undervolt.conf)
source=("git://github.com/kitsunyan/intel-undervolt")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  ./configure --enable-systemd
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
} 
