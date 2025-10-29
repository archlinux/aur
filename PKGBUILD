# Contributor: antsa <asss1924 <plus> aur <at> gmail <dot> com>
# Contributor: cth451 <cth451@gmail.com>

pkgname=materia-theme-git
pkgver=20210322.r53.gd7f59a37
pkgrel=1
pkgdesc="A Material Design theme for GNOME/GTK+ based desktop environments"
arch=('any')
url="https://github.com/nana-4/materia-theme"
license=('GPL-2.0-or-later')
makedepends=(git meson dart-sass gtk3 gtk4 gnome-shell)
optdepends=('gnome-themes-extra: for gtk2 theme'
            'gtk-engine-murrine: for gtk2 theme')
provides=('materia-theme' 'materia-gtk-theme')
conflicts=('materia-gtk-theme')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson build ${pkgname}
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
