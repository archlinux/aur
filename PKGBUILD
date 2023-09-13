# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-bin
pkgver=0.5.1
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
sha512sums=('523f501cb457882979c421cf31a212450fbaf08a9e686c5d9db483a0981eff2c7e5850c0c61ccde19659a7b716af0f3ee929b7c56f1949bc677bcb67004bb4ae'
            '477af45f047a9c7735385ecae2a7c34f4b009481c2f5ce7efbe7251f59ad979fd3e8303c4079b2455a05502654a28f3aa33c6754e3d004f2e9117515c24eeb50')

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
