# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=textsnatcher-git
pkgver=2.0.0.r0.g7192ac1
pkgrel=1
pkgdesc='Copy Text from Images with ease, Perform OCR operations in seconds'
arch=('x86_64')
url="https://github.com/RajSolai/TextSnatcher"
license=('GPL3')
depends=('granite' 'libhandy' 'libportal' 'tesseract')
makedepends=('git' 'meson' 'vala')
optdepends=('scrot: screenshot engine for X11 systems'
            'xdg-desktop-portal: for wayland support, you will need the implementation for your wayland desktop environment')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/^v//;s/-/./g'
}

build() {
  arch-meson "${pkgname%-*}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  ln -s com.github.rajsolai.textsnatcher "$pkgdir/usr/bin/${pkgname%-*}"
}
