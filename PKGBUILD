# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.3.3
pkgrel=1
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL3')
depends=('libadwaita' 'libsoup3' 'python-gobject' 'python-anyascii' 'python-lxml' 'python-pillow' 'python-pluggy' 'python-svglib' 'python-yapsy' 'python-regex' 'python-material-color-utilities' 'libportal-gtk4' 'python-cssutils' 'python-jinja')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
install='xdg-config.install'
source=($url/archive/$pkgver.tar.gz)
b2sums=('94dc17fdd0e00e64125a3885d49db7975bb3fa4ae56fe5b4fd334f0cb809d9f892212e3e1f5e8525ce7e75cca8ab6542ffc5c8165e7974ae2a9d8a5890b61e90')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
