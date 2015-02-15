# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=hdapsd-git
pkgver=20150215
pkgrel=1
pkgdesc='HDAPS userspace hard drive protection daemon'
arch=('i686' 'x86_64')
url='https://github.com/evgeni/hdapsd/'
license=('GPL')
provides=('hdapsd')
conflicts=('hdapsd')
source=('git+https://github.com/evgeni/hdapsd/')
sha256sums=('SKIP')
backup=('etc/hdapsd.conf')
optdepends=('libconfig: (buildtime) for configuration file support')

build() {
  cd "$srcdir/hdapsd/"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/hdapsd/"

  make DESTDIR="${pkgdir}/" install

  mv "${pkgdir}"/usr/lib/udev/rules.d/{,80-}hdapsd.rules
  install -d -m755 "${pkgdir}/etc"
  install -m644 misc/hdapsd.conf "${pkgdir}/etc/"
}

pkgver() {
  date '+%Y%m%d'
}
