# Maintainer: lmartinez-mirror
# Contributor: Artem Senichev <artemsen@gmail.com>

pkgname=swayimg-git
pkgver=1.1.r10.gf0bd709
pkgrel=1
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
provides=('swayimg')
conflicts=('swayimg')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols')
depends=('wayland' 'cairo' 'json-c')
optdepends=('libjpeg: JPEG images support'
            'giflib: GIF images support'
            'librsvg: SVG images support'
            'libwebp: WebP images support'
            'bash-completion: bash autocomplete support')
url='https://github.com/artemsen/swayimg'
source=("$pkgname-$pkgver::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    meson --prefix=/usr build "$pkgname-$pkgver"
    ninja -C build
}

package(){
    DESTDIR="${pkgdir}" ninja -C build install
}
