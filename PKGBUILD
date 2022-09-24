# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.3.0
pkgrel=1
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-anyascii' 'python-lxml' 'python-pillow' 'python-pluggy' 'python-svglib' 'python-aiohttp' 'python-yapsy' 'python-regex' 'python-material-color-utilities' 'libportal-gtk4' 'python-cssutils' 'python-jinja')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
install='xdg-config.install'
source=($url/archive/$pkgver.tar.gz)
b2sums=('87a353097bdde029e75c54f6e73a937c0246a07756a1681772abd68bd9cd05756673ce279e1c6b87a549232d6f1dad76557ce2f13805ea243bb99e3554c02dca')

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
