# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: <castix at autistici dot org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot de>

pkgname=airwindows-lv2
pkgver=26.2
pkgrel=1
pkgdesc="LV2 port of Airwindows audio plugins"
arch=(aarch64 x86_64)
url='https://sr.ht/~hannes/airwindows-lv2'
license=(MIT)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(lv2 meson)
optdepends=('lv2-host: for loading the LV2 format plugins')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~hannes/airwindows-lv2/archive/v$pkgver.tar.gz")
sha256sums=('5d18a6ca23de776a789be5d021a7c8b05a1fc660b6e6df6b3c00f02e77708bf7')

build() {
  meson setup \
    --prefix=/usr \
    --buildtype=release \
     $pkgname-build $pkgname-v$pkgver
  meson compile -C $pkgname-build
}

package() {
  meson install -C $pkgname-build --destdir "$pkgdir"
  install -vDm 644 $pkgname-v$pkgver/{NOTES,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 $pkgname-v$pkgver/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}
