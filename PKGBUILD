# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pavucontrol
pkgname="${_pkgname}"-git
pkgver=6.2.r7.g27980e1
pkgrel=2
pkgdesc='A GTK volume control for PulseAudio'
arch=('i686' 'x86_64' 'aarch64')
url='https://freedesktop.org/software/pulseaudio/pavucontrol/'
license=('GPL-2.0-or-later')
depends=('gtkmm-4.0' 'libpulse' 'libcanberra')
optdepends=('pulseaudio: Use PulseAudio server running on the same host as pavucontrol.')
makedepends=('git' 'meson' 'lynx')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.freedesktop.org/pulseaudio/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    arch-meson ${_pkgname} build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
