# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='avx-turbo'
pkgver='0.1.0'
pkgrel='1'
pkgdesc='Test the non-AVX, AVX2 and AVX-512 speeds across various active core counts'
arch=('x86_64' 'aarch64')
_uri="github.com/travisdowns/${pkgname}"
url="https://${_uri}"
license=('MIT')
makedepends=('git' 'gcc' 'make' 'nasm')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('47b94f747c070ff8a879ed169dd8800f4512de30aea28900d811dfbc12a3a6f9')

prepare() {
  # Use system nasm
  sed --in-place \
    --expression 's|./nasm-2.13.03/nasm|/usr/bin/nasm|g' \
    "${pkgname}-${pkgver}/config.mk"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  ./"${pkgname}-${pkgver}/unit-test"
}

package() {
  install -Dm0755 "${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
