# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=refine
pkgver=0.5.6
pkgrel=1
pkgdesc='Tweak advanced settings in GNOME'
arch=('any')
url='https://tesk.page/refine/'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://gitlab.gnome.org/TheEvilSkeleton/Refine.git#tag=${pkgver}")
b2sums=('60aca6b293904af0c9169369035630c688fbb2ffd531979a127b562915d41f8ea2caeb6d92df1c1a1d26dbcba5f0db1e07f17220ef2712cb6fae204698401296')

build() {
  arch-meson "${pkgname}" build -Dexec_name_as_base_id=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
