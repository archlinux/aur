# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=fasttext
pkgdesc="Library for fast text representation and classification"
url="https://github.com/facebookresearch/fastText"

pkgver=0.9.2
pkgrel=4

arch=("x86_64")
license=("MIT")

# depends=(
#     "gcc12-libs"
# )
optdepends=(
    "fasttext-langid-models"
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/facebookresearch/fastText/archive/v${pkgver}.tar.gz"
    "fasttext_cstdint.patch"
)
b2sums=(
    "ea3af92ce18d04241128cfb28773f0785a006e79c861d718c2c6ad788d776ad60b0543a42eb8be5a865cbc12283355521431fe2fba48544399e4a2b1520ff3f1"
    "0d43a5f027a3a2b0628d8562b5d80a0ae92784fa4d26f838b5ce37d89789e8cb3ead9504ee6e0b30f195895d2e4a9fdd96eef0bb54ff4473764d83db9d365cef"
)

prepare() {
    cd "${srcdir}/fastText-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/fasttext_cstdint.patch"
}

build() {
    cd "${srcdir}/fastText-${pkgver}"
    make
}

package() {
    install -Dm0755 "${srcdir}/fastText-${pkgver}/fasttext" "${pkgdir}/usr/bin/fasttext"
    install -Dm0644 "${srcdir}/fastText-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/fasttext/LICENSE"
}
