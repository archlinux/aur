# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=notes-up-git
pkgver=2.0.6.r0.g7c7e26a
pkgrel=1
pkgdesc='Write beautiful notes fast and easy using Markdown'
arch=('x86_64')
url="https://github.com/Philip-Scott/Notes-up"
license=('GPL2')
depends=('discount' 'granite' 'gtksourceview4' 'gtkspell3' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-*} build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  ln -s com.github.philip_scott.notes-up "$pkgdir/usr/bin/${pkgname%-*}"
}
