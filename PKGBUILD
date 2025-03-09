# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=refine
pkgver=0.5.2
pkgrel=1
pkgdesc='Tweak advanced settings in GNOME'
arch=('any')
url='https://tesk.page/refine/'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://gitlab.gnome.org/TheEvilSkeleton/Refine.git#tag=${pkgver}")
b2sums=('efa9795e9a0049899504caf6e65ce1c540e1849376729c0b2309671b22c2be92609ad5ed4029bad12d99c504ae2cf99cf6c499a656f3d72a14fcadd05f0f4c0c')

build() {
  arch-meson "${pkgname}" build -Dexec_name_as_base_id=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
