# Maintainer: lumi200 <lumi200@posteo.eu>
_pkgname=Retro95
pkgname=greetd-${_pkgname,,}
pkgver=1.1.0
pkgrel=1
pkgdesc="A greeter in 95 OS design language"
arch=('x86_64')
url="https://gitlab.com/lumi200/retro95-greeter"
license=('GPL-3.0-or-later')
depends=('gtkmm-4.0' 'nlohmann-json' 'boost-libs' 'spdlog' 'greetd' 'catch2' 'tomlplusplus' 'libsigc++-3.0' 'gcc-libs' 'fmt' 'glib2' 'glibc' 'glibmm-2.68' 'systemd' 'systemd-libs')
makedepends=('meson' 'ninja' 'boost' 'tomlplusplus')
source=("https://gitlab.com/lumi200/retro95-greeter/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('4e10413cd8fa9b7e07bdb39ab0c0bacc7003bf62f42433af66e843960c18d54d4184f6e53bb846367b1d0f0c3e094f0c9c183d7efa32dc6c95109bca2015c4a1')

build() {
  cd "$pkgname-$pkgver"
  meson setup build
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 ./build/retro95_greeter "$pkgdir/usr/bin/retro95-greeter"
  install -Dm0644 systemd-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_pkgname,,}.conf"
}
