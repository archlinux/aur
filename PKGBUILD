# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-bin
pkgver=0.8.0
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
sha512sums=('49901d0e79dd7dbc89556b13218badd5a11bbc4e388cec65ce8ee1b6d6fe901627f41c156c99be7fd8ec800c4e76a886e2792f55f055e880e3e23dca4eb1b0de'
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
