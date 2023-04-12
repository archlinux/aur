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
b2sums=('bebc9519206e2dc17f7b6dff79e70c3f816140f3bc3a1ac2b36c5c6a51e2419f8bec0c184de1b75b2a3e9be4dca29efe060b0eca8c7c0aa65c8aeaa87422fbb8')

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
