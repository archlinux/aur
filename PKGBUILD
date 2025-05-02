# Maintainer: someone5678 <someone5678 dot dev at google dot com>

pkgname=woff-tools
pkgver=20091003
pkgrel=3
pkgdesc="Tools to convert existing TrueType/OpenType fonts to WOFF and inversely (sfnt2woff and woff2sfnt)"
arch=('any')
url="https://people.mozilla.org/~jkew/woff/"
license=('MPL' 'GPL' 'LGPL')
makedepends=('git')
provides=("$pkgname" 'sfnt2woff' 'woff2sfnt')
conflicts=('sfnt2woff' 'woff2sfnt')

source=(
    # Source archive from https://github.com/wget/woff-tools
    'woff-tools-20091003.tar.gz'
    # Patches from https://salsa.debian.org/fonts-team/woff-tools
    'add-overflow-checks.patch'
    'CVE-2010-1028.patch'
    'fix-compiler-and-cppcheck-warnings.patch'
)
sha512sums=(
    '0969a7b040ced2c1ba6a5b7d60396141f795ac56fdcdb6c663cc9794fdf08f32b35089934b0da498a6d357372daebbebd5149e78bdb368e2c3b675d2adaa4863'
    '842ccd8d63e6c5eab3b4d61ae19a268bf6059b0e3f1c754ca7ea9d2d2ae608bf2b79ecd0cb3ea1859333e1b68f5ca416dd4cc555e27342dfcae36e78612043e8'
    'fcfdba1e00be52af1f96c7a67da310acd5d8361b47c841787b44b86f991f8ba16ef7eb8922cb4e0e360ad7ee8aeb2bb809ef50687b061d2ffff1bc308e86f5da'
    '3d993b351d7fec55bfdca1e0723985a64ef8690652c94e3915c889dbdc75cfcc7f6e3a9218f2df6e1d1834886fa22746b80c3f27bae9796329771154d26c2d0d'
)

build () {
    cd woff-tools-20091003

    for patch in $srcdir/*.patch; do
        git apply $patch
    done

    make
}

package() {
    cd woff-tools-20091003/
    install -Dm755 sfnt2woff "$pkgdir/usr/bin/sfnt2woff"
    install -Dm755 woff2sfnt "$pkgdir/usr/bin/woff2sfn"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
