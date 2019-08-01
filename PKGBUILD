# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=libmpris2client
pkgver=0.1.0+7+g2de25d1
pkgrel=1
pkgdesc="A glib library for controlling any mpris2 compatible player."
arch=('i686' 'x86_64')
url="https://github.com/matiasdelellis/libmpris2client"
license=('GPL2')
depends=('gtk3')
#source=(https://github.com/matiasdelellis/$pkgname/releases/download/V$pkgver/$pkgname-$pkgver.tar.bz2)
source=("git+https://github.com/matiasdelellis/libmpris2client.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r "s/^V//;s/-/+/g"
}

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/lib 
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
