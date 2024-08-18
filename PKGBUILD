# Maintainer: Artem Klevtsov <a.a.klevtsov [at] gmail [dot] com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=byedpi
pkgver=0.12
pkgrel=3
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
        '0ea6f6639a746299a9670b651cf87abbd0ae8bb73d858e9b153416e9d49078577b31350bb95a017e941274a6007c405dbbf84cfef2418fe173985c7c4ce3ca6f'
        'dd51700e972d759a2297bddc15455477a9574b98174e48c6c89236999fb028c09b8eff8a67067bc49e1a8830e43c7a6d76c4c5c644716562818b02320463e1aa'
        'da1d9bbc80c868fb16c4f6e24c3fe00d5d03d5bb0a6d71dac16999b652e81fc9c2a5f0f57e350260b9295d953cb0c3fe316440279dd26b09ee895bf81771cc2b')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  install -vDm644 $pkgname.conf            -t "$pkgdir"/etc/
  install -vDm755 $pkgname-$pkgver/ciadpi  -t "$pkgdir"/usr/bin/
  install -vDm644 $pkgname.service         -t "$pkgdir"/usr/lib/systemd/system/
  install -vDm644 LICENSE                  -t "$pkgdir"/usr/share/licenses/$pkgname/
}
