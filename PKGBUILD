pkgname=beanstalkd
pkgver=1.10
pkgrel=1
epoch=
pkgdesc="Fast, simple message queue server"
arch=('i686' 'x86_64')
url=""
license=('GPL')
depends=()
makedepends=()
conflicts=('beanstalkd-git')
backup=('etc/conf.d/beanstalkd')
options=()
install=
changelog=
source=("https://github.com/kr/beanstalkd/archive/v${pkgver}.tar.gz"
	"beanstalkd@.service"
	"beanstalkd.service"
	"beanstalkd.conf")
md5sums=('0994d83b03bde8264a555ea63eed7524'
         'f6151d5d2f07c24977cafba38a9e67c9'
         'd05b907abfb19174a7321676ecc0c819'
         '7fdc2e3d1dc9c6559b7b007b74588a09')



prepare() {
  cd "$srcdir/$pkgname-$pkgver"

}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CFLAGS="${CFLAGS}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  #systemd files
  install -D -m644 "adm/systemd/beanstalkd.socket" "${pkgdir}/usr/lib/systemd/system/beanstalkd.socket"
  install -D -m644 "${srcdir}/beanstalkd.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd.service"
  install -D -m644 "${srcdir}/beanstalkd@.service" "${pkgdir}/usr/lib/systemd/system/beanstalkd@.service"
  install -D -m644 "${srcdir}/beanstalkd.conf" "${pkgdir}/etc/conf.d/beanstalkd"

  install -D -m644 "doc/beanstalkd.1" "${pkgdir}/usr/share/man/man1/beanstalkd.1"
  
}

# vim:set ts=2 sw=2 et:
