# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jalv-select
pkgver=1.3
pkgrel=5
pkgdesc='A small GUI to select installed LV2 plugins and run them with jalv'
arch=(x86_64 aarch64)
url='https://github.com/brummer10/jalv_select'
license=(Unlicense)
depends=(gtkmm jalv)
makedepends=(lilv serd sord sratom)
source=("$pkgname-$pkgver.tar.gz::https://github.com/brummer10/${pkgname/-/_}/archive/v$pkgver.tar.gz")
sha256sums=('13227087f107e35ecf51897ed63050c5ba6df1b442ffb2f7e876c46fb0fe11d7')

prepare() {
  cd ${pkgname/-/_}-${pkgver}
  # Don't compress man pages, that's makepkg's job
  sed -i -e '/gzip/d' Makefile
}

build() {
  cd ${pkgname/-/_}-${pkgver}
  make
}

package() {
  depends+=(liblilv-0.so libserd-0.so libsord-0.so libsratom-0.so)
  cd ${pkgname/-/_}-${pkgver}
  make install DESTDIR="$pkgdir"
  # readme
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
