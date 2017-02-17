# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol
pkgver=3.1.3
pkgrel=1
epoch=2
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.sourceforge.net"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
install='firehol.install'
source=("https://github.com/firehol/firehol/releases/download/v$pkgver/firehol-$pkgver.tar.xz"
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

md5sums=('e90ceeae12905b8e97c15e2a7718f58b'
         '6c6571af548273e1f172313e366532df'
         'ae9fc18b19a69149108e9f4ab9ba5de9')
