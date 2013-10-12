# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=hdapsd-git
pkgver=20130625
pkgrel=1
pkgdesc='HDAPS userspace hard drive protection daemon'
arch=('i686' 'x86_64')
url='https://github.com/evgeni/hdapsd/'
license=('GPL')
depends=('glibc')
provides=('hdapsd')
conflicts=('hdapsd')
source=('git+https://github.com/evgeni/hdapsd/')
sha256sums=('SKIP')

build() {
  cd "$srcdir/hdapsd/"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/hdapsd/"

  make DESTDIR="${pkgdir}/" install

  mv "$pkgdir"/usr/lib/udev/rules.d/{,80-}hdapsd.rules
}

pkgver() {
  date '+%Y%m%d'
}
