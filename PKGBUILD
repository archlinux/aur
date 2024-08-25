# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.13.1
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
        'af0b8416384c61f30ba5be3f83e0ff0f16c88c58b1337e58223de3b48f85dfa9f69d212c5917f9f835a70a2997a9ade0aec0e2cedd996a89551e77559369b7e3')

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
