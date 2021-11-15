# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Original Maintainer: Luca P <meti at lplab.net>

pkgname='hss'
pkgver=1.8
pkgrel=4
arch=('x86_64' 'i686')
pkgdesc='Interactive ssh client for multiple servers.'
url='https://github.com/six-ddc/hss'
license=('GPL')
depends=(readline)
source=(
    "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
    # https://github.com/six-ddc/hss/pull/13
    "cppflags.patch::https://github.com/six-ddc/hss/commit/70b8e897a750856e1aa2d747f29fb94d085dfe26.patch"
)
sha512sums=('7dbf4beda10fdf0a7f6c54748c9f5731c61ab98c9ea2575f6b6d64fe5db510ea2f131ff5af89f7a244cfab23b195c662b4cc8a7cbd775cb7d3a327473c3f2b13'
            'bf2015f8dc4270c9a1d5f5e878634592bea99a6b773b62995ae8ef35265280e3980fc1e6486358e22958822da748d8bee4933d08b9ff886b33a64a24f9162ef9')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 -i ../cppflags.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  make all
}

package() {
  cd "${pkgname}-${pkgver}"

  make INSTALL_BIN="${pkgdir}/usr/bin" install
}
