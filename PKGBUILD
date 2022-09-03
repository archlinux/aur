# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gradience
_pkgname=Gradience
pkgver=0.2.2
pkgrel=1
pkgdesc="Change the look of Adwaita, with ease"
arch=('x86_64')
url="https://github.com/GradienceTeam/Gradience"
license=('GPL3')
depends=('libadwaita-git>=1.2.alpha' 'python-gobject' 'python-anyascii' 'python-pillow' 'python-pluggy' 'python-svglib' 'python-urllib3' 'python-regex' 'python-material-color-utilities' 'libportal-gtk4')
makedepends=('meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
optdepends=('adw-gtk3: The theme from libadwaita ported to GTK-3'
            'adw-gtk-theme: LibAdwaita Theme for all GTK3 and GTK4 Apps.')
install='xdg-config.install'
source=($url/archive/$pkgver.tar.gz)
b2sums=('4a2b268574d9cbe1007594e32991a8d70519273d8eeae25993f47bfb17b0d8510cdad58cba70b4e6dbb3dfaff531c8f785456714c86ce2df9b469102830aa94a')

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
