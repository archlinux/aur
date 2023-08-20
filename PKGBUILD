# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-nightly-bin
pkgver=20230820050226
pkgrel=1
pkgdesc="The Lingua Franca compiler and command line tools (nightly release)"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'bash')
replaces=('lfc-bin')
conflicts=('lfc-bin' 'lf-cli-bin')
source=("https://github.com/lf-lang/lingua-franca/releases/download/nightly/lf-cli-0.4.1-SNAPSHOT-nightly-${pkgver}-Linux-x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/master/LICENSE")
sha512sums=('c134f7844eb40cd80326f8c1482f4495354c0edee9e35dec20dd1dffbe6380d5f364e36553d15e3673372d512259003a2e13f4012ff95698dcda74af96879f76'
            '477af45f047a9c7735385ecae2a7c34f4b009481c2f5ce7efbe7251f59ad979fd3e8303c4079b2455a05502654a28f3aa33c6754e3d004f2e9117515c24eeb50')

package() {
    for f in "${srcdir}/lf-cli-0.4.1-SNAPSHOT-nightly-${pkgver}-Linux-x86_64/lib"/*.jar; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/java/${pkgname}/lib/$(basename "$f")"
    done
    install -Dm755 "${srcdir}/lf-cli-0.4.1-SNAPSHOT-nightly-${pkgver}-Linux-x86_64/bin/lfc" "${pkgdir}/usr/share/java/${pkgname}/bin/lfc"
    install -Dm755 "${srcdir}/lf-cli-0.4.1-SNAPSHOT-nightly-${pkgver}-Linux-x86_64/bin/lfd" "${pkgdir}/usr/share/java/${pkgname}/bin/lfd"
    install -Dm755 "${srcdir}/lf-cli-0.4.1-SNAPSHOT-nightly-${pkgver}-Linux-x86_64/bin/lff" "${pkgdir}/usr/share/java/${pkgname}/bin/lff"
    mkdir "${pkgdir}/bin"
    cd "${pkgdir}/bin"
    ln -s "../usr/share/java/${pkgname}/bin/lfc" lfc
    ln -s "../usr/share/java/${pkgname}/bin/lfd" lfd
    ln -s "../usr/share/java/${pkgname}/bin/lff" lff
}
