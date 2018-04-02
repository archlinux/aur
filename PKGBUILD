# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=coredns
pkgver=v1.1.1
pkgrel=1
pkgdesc="CoreDNS is a DNS server that chains plugins"
makedepends=('go' 'make')
conflicts=('coredns-bin')
arch=('i686' 'x86_64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns::https://github.com/coredns/${pkgname}/archive/${pkgver}.tar.gz
https://raw.githubusercontent.com/coredns/deployment/5bb111266eca2d47802e0d1a26bc55491ff2cec3/systemd/coredns.service
coredns-sysusers.conf)

sha256sums=('608c883ee00c856f97197f7629c999fbcc0db932120a31654131f26df7b64053'
'be3eb5ce8740b17053aaf04ca036a4d34e0b86d0737253be7094cda16a329cf5'
'178c632fd855a5a35ae69e13ab554d5abad696cf75d23c6b6b37f0ace3b4b0f2')

build() {
  cd "$pkgname-${pkgver//v/}"
  make
}

package() {
  install -Dm755 "$srcdir/coredns-${pkgver//v/}/coredns" "$pkgdir/usr/bin/coredns"
  install -Dm644 "$srcdir/coredns.service" "$pkgdir/usr/lib/systemd/system/coredns.service"
  install -Dm644 "$srcdir/coredns-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/coredns.conf"
  install -d "${pkgdir}/etc/coredns"
}
