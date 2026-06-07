# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.2.2
pkgrel=4
pkgdesc='Openbox clone on Wayland'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('bash' 'glibc' 'libevdev' 'libinput' 'libwlroots-0.18.so' 'libxkbcommon' 'libxml2' 'wayland')
makedepends=('git' 'meson' 'wayland-protocols')
#source=("git+https://github.com/wizbright/${pkgname}.git#tag=${pkgver}")
source=("git+https://github.com/wizbright/${pkgname}.git#commit=b2e686171f3b5874f30cc19495416de81482a0e9")
b2sums=('2c7b4c433ab091ea9fdcb160b542346d16b03b32621db955831806fe2c59b635227bb8240d0035b3ce6c31a974a76d6ea18321613fbd7d807f681a5c9656d858')


build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m 644 "$pkgname"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
