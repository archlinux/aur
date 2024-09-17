# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.14
pkgrel=2
pkgdesc="A simple and fast software designed to bypass Deep Packet Inspection"
arch=(aarch64 armv6h armv7h x86_64)
url="https://github.com/hufrea/$pkgname"
license=(MIT)
depends=(glibc)
options=(!debug)
backup=(etc/$pkgname.conf)
source=(
  $pkgname.{conf,service}
  $url/raw/main/LICENSE
  $url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('26d0b11e667d804c6795d2aaf1af8977ff198082cde53cd60a19fe80b38925cc3999287760ce2e676f0ad2ac67516f4b10457e9f88a6d9898113cdb720ee5339'
        '4edf7a873d9abfc0aedfc4219f2911280a4abb6e595336ef8fb33dd9cce37c07409f67c7e9cb25e6ae9be273a8815cb5baf651becd2eca7302f527c8034d3432'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa'
        '45da87745d8d80e32aa11bb278349b15e3ee2c5efc0fc917b899edcceca2d687f0e0a0e927d47d7d5d69c4b56b24b622ad095eca8de212d1a7590f8ad43e3e6c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  install -vDm644 $pkgname.conf           -t "$pkgdir"/etc/
  install -vDm755 $pkgname-$pkgver/ciadpi -t "$pkgdir"/usr/bin/
  install -vDm644 $pkgname.service        -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}
