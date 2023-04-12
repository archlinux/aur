# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.4.1_patch1
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
source=($url/archive/${pkgver//_/-}.tar.gz)
b2sums=('ca16dacd9c5c4af901a5e289d11aafa0a581f43477ea473d06e92a17582b6e397de60ab2e52036602e4028b0fde688a5511c6b7ba0577c08c03a6ed50e04383d')

build() {
  arch-meson "$_pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
