# Maintainer Crewmate <sus@morshu.xyz>
pkgname=materia-transparent-gtk-theme-git
pkgver=85bdc29
pkgrel=2
pkgdesc="A Transparent Material Design theme for GNOME/GTK+ based desktop environments"
arch=(any)
license=(GPL)
depends=(gnome-themes-extra)
makedepends=(meson npm gtk3 gtk4 gnome-shell)
optdepends=('gtk-engine-murrine: for gtk2 theme')
provides=(materia-theme)
conflicts=(materia-theme)
replaces=(materia-theme)
source=(
  "git+https://github.com/ckissane/materia-theme-transparent#commit=85bdc29"
  remove-npm-install-from-meson-build.patch
)
md5sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd materia-theme-transparent
  patch -Np1 < ${srcdir}/remove-npm-install-from-meson-build.patch
  npm install --cache ${srcdir}/npm-cache
}

build() {
  arch-meson materia-theme-transparent build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
