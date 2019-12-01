# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=obs-nvfbc-git
_pkgname=obs-nvfbc
pkgver=r18.7fa7706
pkgrel=1
pkgdesc="OBS Studio source plugin for NVIDIA FBC API"
arch=('x86_64')
license=('LGPL2.0')
url="https://gitlab.com/fzwoch/obs-nvfbc"
provides=('obs-nvfbc')
conflicts=('obs-nvfbc')
depends=('obs-studio')
makedeps=('meson')
source=(git+https://gitlab.com/fzwoch/obs-nvfbc.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson "$srcdir/$_pkgname" build --prefix=/usr
  ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
