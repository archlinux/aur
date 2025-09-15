# Maintainer: Sauru <sauruuwu at gmail dot com>

pkgname=vapoursynth-plugin-f3kdb-sauruuwu-git
pkgver=2.0.1.r0.g652974d
pkgrel=1
pkgdesc='A deband library and filter for avisynth/vapoursynth (sauruuwu fork)'
arch=(x86_64)
url=https://github.com/sauruuwu/flash3kyuu_deband
license=(GPL-3.0-or-later)
provides=('vapoursynth-plugin-f3kdb')
conflicts=('vapoursynth-plugin-f3kdb-git')
depends=('vapoursynth')
makedepends=('git' 'python')
source=("${pkgname}::git+https://github.com/sauruuwu/flash3kyuu_deband")
sha256sums=(SKIP)

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  ./waf configure
}

build() {
  cd "${pkgname}"
  ./waf build
}

package() {
    cd "${pkgname}"
    ./waf install --no-ldconfig --destdir="${pkgdir}"
    install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
