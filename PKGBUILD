# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=libassuan-git
pkgver=2.5.4
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url='https://www.gnupg.org/related_software/libassuan/'
arch=('x86_64')
license=('GPL')
depends=('libgpg-error')
provides=(libassuan)
conflicts=(libassuan)
source=("git://git.gnupg.org/libassuan.git")
sha256sums=('SKIP')
#validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # "Werner Koch (dist signing 2020)"

pkgver() {
  cd libassuan
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd libassuan
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

#check() {
#  cd libassuan
#  make check
#}

package() {
  cd libassuan
  make DESTDIR="${pkgdir}" install
}
