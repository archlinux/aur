# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=refine
pkgver=0.6.3
pkgrel=1
pkgdesc='Tweak advanced settings in GNOME'
arch=('any')
url='https://tesk.page/refine/'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
source=("${pkgname}::git+https://gitlab.gnome.org/TheEvilSkeleton/Refine.git#tag=${pkgver}")
b2sums=('ca0a20bf893a112b8426123caf6616fdffb717707bdf16772e412dd59c37ac98fa6599a073ed797ddd37db78b32847f6c0b4f88940bae1d6214e077b160bb01e')

build() {
  arch-meson "${pkgname}" build -Dexec_name_as_base_id=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
