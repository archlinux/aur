# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=alsa-hdspeconf
pkgver=1.0
pkgrel=1
pkgdesc='RME HDSPe MADI/AES/RayDAT/AIO/AIO-Pro sound cards user space configuration tool'
url='https://github.com/PhilippeBekaert/hdspeconf'
arch=('any')
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'bash'
  'gcc-libs'
  'glibc'
  'wxwidgets-common'
  'wxwidgets-gtk3'
)
makedepends=('git')
provides=("alsa-hdspeconf=${pkgver}-${pkgrel}")
source=("git+https://github.com/PhilippeBekaert/hdspeconf.git"
        'hdspeconf.sh'
        'hdspeconf.desktop')
sha256sums=('SKIP'
            '7cc0d36a8045fa3df9812312573eec4410299b0859de1a5f7d6bd39346ee0fdf'
            '7fb5fc77cc38d72863ff1d71bfba4de5c8a1d4b7308324fa116884df5f35bf78')

build() {
  cd hdspeconf
  make depend
  make
}

package() {
  install -Dm755 hdspeconf/hdspeconf -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 hdspeconf/dialog-warning.png -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/hdspeconf.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm755 "${srcdir}/hdspeconf.sh" "${pkgdir}/usr/bin/hdspeconf"
}

# vim: ts=2 sw=2 et:
