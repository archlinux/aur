# Maintainer: <VCalV>

pkgname=lobster-language-bin
pkgver=2025.4
pkgrel=1
pkgdesc="Lobster programming language"
arch=('x86_64')
url="https://github.com/aardappel/lobster"
license=('Apache-2.0')
depends=('mesa')
makedepends=('git')
conflicts=('lobster' 'lobster-language')
source=(
	"$pkgname-$pkgver.zip::https://github.com/aardappel/lobster/releases/download/v${pkgver}/lobster_linux_release.zip"
	"LICENSE.txt::https://raw.githubusercontent.com/aardappel/lobster/refs/tags/v${pkgver}/dev/LICENSE.txt"
)
sha512sums=(
	'ed84ef9a105ba41d14b2e122b2563d42a81a26c485e75bfc16e9a1462236751c1184b9c2921c3ca3d15450391aef64142ac352e30e363c4dd6e206f16c9522b5'
	'98f6b79b778f7b0a15415bd750c3a8a097d650511cb4ec8115188e115c47053fe700f578895c097051c9bc3dfb6197c2b13a15de203273e1a3218884f86e90e8'
)


package() {
    install -Dm755 "${srcdir}/bin/lobster" "${pkgdir}/usr/bin/lobster"

    # Main share directory
    _share="${pkgdir}/usr/share/Lobster"
    install -d "$_share"

    # Copy groups of directories
    for d in data modules samples tests; do
        cp -r "${srcdir}/${d}" "$_share/"
    done

    # Documentation
    install -d "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/docs" "${pkgdir}/usr/share/doc/Lobster"

	install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

}
