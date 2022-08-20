# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.1.0
pkgrel=1
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL3')
depends=('libadwaita-git>=1.2.alpha' 'python-gobject' 'python-anyascii' 'python-pillow' 'python-svglib' 'python-regex' 'python-material-color-utilities' 'libportal-gtk4')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
install='xdg-config.install'
source=($url/archive/$pkgver.tar.gz)
b2sums=('01de01ca94c9e6981fe3a46019acb526930f224adcadddf4f2e88f1f55c6b11df2ca8a3a92898f4dc54537fc1b2646078088ae9131cf41d5f673672401ebad0b')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
