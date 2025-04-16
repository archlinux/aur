# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=refine
pkgver=0.5.7
pkgrel=1
pkgdesc='Tweak advanced settings in GNOME'
arch=('any')
url='https://tesk.page/refine/'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://gitlab.gnome.org/TheEvilSkeleton/Refine.git#tag=${pkgver}")
b2sums=('efc78968f4f9a9d6f3247a2a8bb9ec68341557e112faa6759f31e059f4d30eca85849d69995c5d84618b3d432a3a109eb65aa338cce74fbcf2817d586387d92c')

build() {
  arch-meson "${pkgname}" build -Dexec_name_as_base_id=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
