# Maintainer: Giulio Lettieri <giulio.lettieri@gmail.com>

pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=1.2.4
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/lite-xl/lite-xl-plugin-manager"
license=('MIT')
depends=('lua' 'zlib' 'libzip' 'libgit2' 'mbedtls2')
makedepends=('meson')
source=("${_gitname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96d06bc7a35eb724ba7c165188b5fea02c540ce8b3bfb5e2a1cc86cd08ce40d9')

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
