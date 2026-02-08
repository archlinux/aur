# Maintainer: Atif Chowdhury <iftakhar dot awal at gmail dot com>

# shellcheck disable=SC2034,SC2154,SC2164

pkgname=hunspell-bn
pkgver=2026.02.07
pkgrel=3
pkgdesc="Bengali hunspell dictionaries"
arch=('any')
license=('GPL')
depends=('hunspell')
_commit=74b6ae2a2df22fd9d6e253f0391ac3a67cb7b3f8
source=(
    "https://raw.github.com/LibreOffice/dictionaries/${_commit}/bn_BD/COPYING"
    "https://raw.github.com/LibreOffice/dictionaries/${_commit}/bn_BD/bn_BD.aff"
    "https://raw.github.com/LibreOffice/dictionaries/${_commit}/bn_BD/bn_BD.dic"
)
sha256sums=(
    '204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994'
    '6beeacefab0f691cb415c9ab8de227091a3be65510c3d8c0479513b261e61b97'
    'cfc78b361861a726d22f0654d7c4e0b47f843c4a9e8b605c4c99e91ea683e116'
)

package() {
    install -vD -m644 bn_BD.dic bn_BD.aff -t "${pkgdir}/usr/share/hunspell"

    pushd "${pkgdir}/usr/share/hunspell"
    ln -sv bn_BD.dic bn_IN.dic
    ln -sv bn_BD.aff bn_IN.aff
    popd

    install -vD -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/myspell/dicts"

    pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in "${pkgdir}"/usr/share/hunspell/bn_*; do
        ln -sv /usr/share/hunspell/"$(basename "$file")" .
    done
    popd
}
