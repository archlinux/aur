# Maintainer: Martin -nexus- Mlynář <nexus+arch@smoula.net>
pkgname=tayga
pkgver=0.9.2
pkgrel=2
pkgdesc="TAYGA NAT64 daemon"
arch=('i686' 'x86_64')
url="http://www.litech.org/tayga/"
license=('GPL')
source=(
	"http://www.litech.org/tayga/tayga-${pkgver}.tar.bz2"
	"tayga.conf"
	"tayga.service"
)
md5sums=('7a7b24165ce008df772f398d86fa280e'
         '0b818fcfe82dc618bb36da705de18ee3'
	 '9d41c4a9effcf1402bae3141917effa9')

build() {
  cd $srcdir/tayga-${pkgver}
  ./configure --prefix=/usr/ --sbindir=/usr/bin/
  make
}

package() {
  cd $srcdir/tayga-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../tayga.service "${pkgdir}"/usr/lib/systemd/system/tayga.service
  install -Dm644 ../tayga.conf "${pkgdir}"/etc/tayga.conf
  mkdir -p "${pkgdir}"/var/db/tayga
}
