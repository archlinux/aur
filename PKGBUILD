# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=bookworm-git
pkgver=1.1.1.r48.g3537e86
pkgrel=1
pkgdesc='A simple user centric eBook reader which displays multiple eBooks formats uniformly'
arch=('x86_64')
url='https://babluboy.github.io/bookworm'
license=('GPL3')
depends=('libgranite.so' 'poppler-glib' 'unarchiver' 'unzip' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/babluboy/bookworm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    arch-meson ${pkgname%-*} build -Db_pie=false
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
