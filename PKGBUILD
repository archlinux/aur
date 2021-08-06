# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=password-for-gnome-vala-git
pkgver=r49.0d225f4
pkgrel=1
pkgdesc="Calculator and random generator password for GNOME"
arch=('any')
url="https://gitlab.com/elescoute/password-for-gnome-vala"
license=('GPL3')
depends=('glib2' 'gtk3' 'webkit2gtk' 'libhandy')
makedepends=('git' 'meson' 'vala')
source=(git+$url.git)
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson ${pkgname%-git} build
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
