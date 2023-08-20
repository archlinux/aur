# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=lf-cli-nightly-bin
pkgver=20230810050244
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
sha512sums=('1d13f681c0b612b610199e526e585ba9764941439dc5e4dcb185cc662f0f7fc3595848aa23a58cf35d7d73cd64bb7c7213ff99dd1f09bde9998c55e567a6b290'
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
