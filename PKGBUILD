# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=refine
pkgver=0.6.0
pkgrel=1
pkgdesc='Tweak advanced settings in GNOME'
arch=('any')
url='https://tesk.page/refine/'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://gitlab.gnome.org/TheEvilSkeleton/Refine.git#tag=${pkgver}")
b2sums=('3b18370bf3e841558b572705de23c190fc627e4f403a81fefba7b8a4af19d7f8875c65fbd2486cf3301061f9a9eee5280cc4fcd7eb4c3f901ead3d5ae25ab31a')

build() {
  arch-meson "${pkgname}" build -Dexec_name_as_base_id=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
