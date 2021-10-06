# Maintainer: imp0 <jan <(@)> siteworld <(.)> be>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=helvum
pkgver=0.3.1
pkgrel=2
pkgdesc='GTK-based patchbay for pipewire, inspired by the JACK tool catia'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://gitlab.freedesktop.org/ryuukyu/helvum'
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('rust' 'clang' 'meson')
conflicts=('helvum-git')
source=("https://gitlab.freedesktop.org/ryuukyu/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6a8bafb6302d2638e76d22f348bba1ca222857d5dde42f178853151bf50161574e1a534d7194decab4677651d152ac38dcefa3cfde28ea8630ca0360c3b88868')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  # Installs license
  cd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
