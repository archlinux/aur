# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.14
pkgrel=1
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
b2sums=('48efdd4c15bfab7b259717f2858ea774c037ce2e07f9535ffdc6ad9c267e04585644b37980e288354c368681ed43e0f2b7b57c8a5525886949054c2a5740da6f'
        '077b924cab222514033f2930593e071acb8aa0c4ceb3fda051e8fa0c557796b3a7cdd2013ff057ad42b5f5fe738362ff36f458d425fc7a78af07767c89cdc16c'
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
