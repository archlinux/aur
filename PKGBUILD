# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname="patchage"
pkgver=1.0.10
pkgrel=4
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('x86_64')
url="https://drobilla.net/software/patchage.html"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'atkmm' 'ganv' 'gcc-libs' 'glib2' 'glibc' 'glibmm' 'gtk2'
         'gtkmm' 'hicolor-icon-theme' 'jack' 'libsigc++') # 'fmt9'
makedepends=('dbus-glib' 'meson>=0.56' 'reuse')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.drobilla.net/${_pkgsrc}.tar.xz"
        "${_pkgsrc}.tar.xz.sig::https://download.drobilla.net/${_pkgsrc}.tar.xz.sig")
b2sums=('db7e17acc483b1fec27c80a3bedf3b546d303d8ce4f90f7f7669a4e4e1dcb526881d949d91edfdd6283dff3d9382c4c3534972065e2769a43e9e4b982b0dfbec'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
  arch-meson "${_pkgsrc}" build
  meson compile -C build
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
