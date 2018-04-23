# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=coredns
pkgver=v1.1.2
pkgrel=1
pkgdesc="CoreDNS is a DNS server that chains plugins"
makedepends=('go' 'make')
conflicts=('coredns-bin')
arch=('i686' 'x86_64')
url="https://github.com/coredns/coredns"
license=('Apache')
provides=('coredns')
source=(coredns::https://github.com/coredns/${pkgname}/archive/${pkgver}.tar.gz
https://raw.githubusercontent.com/coredns/deployment/39c9f7ed7640f86fa0fb6ba06a88e9afa830b306/systemd/coredns.service
https://raw.githubusercontent.com/coredns/deployment/39c9f7ed7640f86fa0fb6ba06a88e9afa830b306/systemd/coredns-sysusers.conf)


sha256sums=('8715d41d43adacd3cf9db0a9f6599de4d3024a1808a8029bf4c0d0931397ce35'
'947b4838af48212ecd8e565155c97ca61ff7d408d0b8622499925b6e232656c4'
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
