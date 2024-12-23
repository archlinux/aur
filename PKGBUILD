# Maintainer: envolution
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=7-zip
pkgver=24.09
pkgrel=1
pkgdesc="File archiver with a high compression ratio"
url=https://7-zip.org
license=(BSD-2-Clause BSD-3-Clause LGPL-2.1-or-later LicenseRef-LGPL-2.1-or-later-with-unRAR-restriction LicenseRef-unRAR)
arch=(x86_64)
depends=(gcc-libs glibc)
makedepends=(meson uasm)

# Alternative sources:
# * https://github.com/ip7z/7zip/releases/download/${pkgver}/7z${pkgver//\./}-src.tar.xz
# * https://downloads.sourceforge.net/project/sevenzip/7-Zip/${pkgver}/7z${pkgver//\./}-src.tar.xz
source=("https://7-zip.org/a/7z${pkgver//\./}-src.tar.xz"
  meson.build.template
  BSD-2-Clause.txt
  BSD-3-Clause.txt)

sha256sums=('49c05169f49572c1128453579af1632a952409ced028259381dac30726b6133a'
            '6839fb03ccd781351037313be9bf6078126a222f1a1c6f16e55060bfa8646402'
            '017b5ee48f680e82cba79141c7895a1f02b856df2512225f5c427fe36765ef0b'
            '3cf06aba3588c41c514f6946bb2d757b413ff6491647d474800f55edca75dcb4')

prepare() {
  cp meson.build.template meson.build

  meson rewrite kwargs set project / version ${pkgver}
}

build() {
  arch-meson . build

  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
