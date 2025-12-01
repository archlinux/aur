# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.4
pkgrel=2
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz"
        "0001-fix-date_to_days.patch")
b2sums=('c84fb6490f532ade8746a098217f7ef887d2c4d45bd9e20b189a39856222b3bd278a519027cf474dbb440e873db03ce982afd57d202435b34fad91d7d0de969a'
        '9f8990e232b62fb3d71eeb9bb57e943b2a3a1bfd2cc09fa85bf625dc9141e56d6620168aaa89ed40a76c4b06059bd9ac01d011103d6f35075066d62528079057')

prepare() {
  cd WuMing-${pkgver}
  patch -p1 < ../0001-fix-date_to_days.patch
}

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
