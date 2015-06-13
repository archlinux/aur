# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol
pkgver=2.0.3
pkgrel=1
epoch=2
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.sourceforge.net"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
install='firehol.install'
source=("http://firehol.org/download/releases/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "firehol.service"
        "fireqos.service")

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib
  
  make
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  install -d -m755 "$pkgdir"/usr/lib/systemd/system/
  install -m644 "$srcdir"/fire{hol,qos}.service "$pkgdir"/usr/lib/systemd/system/

  touch "$pkgdir"/etc/firehol/fire{hol,qos}.conf
}

md5sums=('454f4fa026874500be8876b2560899cb'
         '6c6571af548273e1f172313e366532df'
         'ae9fc18b19a69149108e9f4ab9ba5de9')
