# Maintainer: Giulio Lettieri <giulio.lettieri@gmail.com>

pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=1.2.2
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/lite-xl/lite-xl-plugin-manager"
license=('MIT')
depends=('lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
makedepends=('meson')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('62aa8c5276a006dc8f796bbb9c651dc743aa28b00673f3c1925de89cb99f9cf4')

build() {
  cd "${_gitname}-${pkgver}"
  CFLAGS="$CFLAGS -DLPM_VERSION='\"${pkgver}\"' -DLPM_DEFAULT_RELEASE=''"
  arch-meson -Dstatic=true . build
  meson compile -C build
}

package() {
  install -D "${srcdir}/${_gitname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -t "${pkgdir}/usr/share/licenses/lpm/" "${srcdir}/${_gitname}-${pkgver}/LICENSE"
  install -D -t "${pkgdir}/usr/share/doc/lpm/" "${srcdir}/${_gitname}-${pkgver}/"{README,SPEC}.md
}
