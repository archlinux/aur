# Maintainer: Jezer Mejía <amyuki4@gmail.com>

pkgname=web-greeter
pkgver=4.0.0
pkgrel=1
pkgdesc='A modern, visually appealing greeter for LightDM'
arch=('any')
url='https://github.com/JezerM/web-greeter'
license=('GPL3')
depends=('lightdm' 'python3' 'gobject-introspection' 'libxcb' 'libx11' 'cairo')
makedepends=('meson' 'ninja' 'gcc' 'typescript' 'git' 'uv')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
sha512sums=('SKIP')
backup=('etc/lightdm/web-greeter.toml')
conflicts=('nody-greeter')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname-$pkgver"
  meson build -Dprefix=/usr -Dsysconfdir=/etc
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}
