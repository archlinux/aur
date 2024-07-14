# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools"
arch=('x86_64' 'aarch64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
replaces=('lfc-bin')
conflicts=('lfc-bin' 'lf-cli' 'lf-cli-nightly' 'lf-cli-nightly-bin')
source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/lf-cli-${pkgver}-Linux-${CARCH}.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('e765a4c9e69a08ef9de53058d1b12a01f543a80580df71f982051a1132893da3f5ad94af9a7b1e766734ebd64eb2758c013275a9b98f3f0d091121a731c82ebd'
            '18891c00ad4a0c7137d6ba0daff30fc7131dd8a4528ef26219d880fd4b6bd575bcf76efb6c3430a1d1bb21739139af20761264825767f59859aecaa459139824')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lfc-cli/LICENSE"

    cd "${srcdir}/lf-cli-${pkgver}-Linux-${CARCH}"

    for f in lib/*.jar; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/java/lf-cli/lib/$(basename "$f")"
    done
    install -Dm755 "bin/lfc" "${pkgdir}/usr/share/java/lf-cli/bin/lfc"
    install -Dm755 "bin/lfd" "${pkgdir}/usr/share/java/lf-cli/bin/lfd"
    install -Dm755 "bin/lff" "${pkgdir}/usr/share/java/lf-cli/bin/lff"

    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "../share/java/lf-cli/bin/lfc" lfc
    ln -s "../share/java/lf-cli/bin/lfd" lfd
    ln -s "../share/java/lf-cli/bin/lff" lff
}
