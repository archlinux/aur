# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgbase=deadbeef-plugin-waveform-git
pkgname=(deadbeef-plugin-waveform-gtk2-git deadbeef-plugin-waveform-gtk3-git)
pkgver=0.5.r91.g4afd845
pkgrel=2
_pkgdesc="Waveform Seekbar plugin for DeaDBeeF audio player"
url="https://github.com/cboxdoerfer/ddb_waveform_seekbar"
arch=(x86_64 i686)
license=(GPL-2.0-or-later)
makedepends=(git gtk2 gtk3 deadbeef)
source=("git+https://github.com/cboxdoerfer/ddb_waveform_seekbar.git"
        "deadbeef-plugin-waveform.patch::https://github.com/Jbsco/ddb_waveform_seekbar/commit/2e5ea867a77e37698524d22f41fc59ffae16e63d.patch")
sha256sums=('SKIP'
            'd2c2c65e194fea903094dae45430b3d1b38268072aec5d59c3b2da4aa2712f4d')

pkgver() {
  cd "${srcdir}/ddb_waveform_seekbar"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "ddb_waveform_seekbar"
  patch -Np1 -i ../deadbeef-plugin-waveform.patch
}

build() {
  cd "ddb_waveform_seekbar"
  make
}

package_deadbeef-plugin-waveform-gtk2-git() {
  pkgdesc="${_pkgdesc} GTK2"
  depends=(deadbeef sqlite gtk2)
  conflicts=(deadbeef-plugin-waveform-gtk2)
  provides=(deadbeef-plugin-waveform-gtk2)
  install -D -v -c "${srcdir}/ddb_waveform_seekbar/gtk2/ddb_misc_waveform_GTK2.so" "${pkgdir}/usr/lib/deadbeef/ddb_misc_waveform_GTK2.so"
}

package_deadbeef-plugin-waveform-gtk3-git() {
  pkgdesc=${_pkgdesc}" GTK3"
  depends=(deadbeef sqlite gtk3)
  conflicts=(deadbeef-plugin-waveform-gtk3)
  provides=(deadbeef-plugin-waveform-gtk3)
  install -D -v -c "${srcdir}/ddb_waveform_seekbar/gtk3/ddb_misc_waveform_GTK3.so" "${pkgdir}/usr/lib/deadbeef/ddb_misc_waveform_GTK3.so"
}
