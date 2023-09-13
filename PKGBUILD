# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'perl')
conflicts=('epoch-nighly-bin')

source=("https://github.com/lf-lang/epoch/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/epoch/v${pkgver}/LICENSE")
sha512sums=('3c181b4377911f5b1ee0ce9676261c8d0c0bca4c980c624aa237f2647cf62315853597860766f37a33b14326c188e2adbc841fe372b3bb0088d09b82c3516d0e'
            '477af45f047a9c7735385ecae2a7c34f4b009481c2f5ce7efbe7251f59ad979fd3e8303c4079b2455a05502654a28f3aa33c6754e3d004f2e9117515c24eeb50')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch/LICENSE"

    install -dm755 "${pkgdir}/usr/share/java/epoch"
    cp -r "${srcdir}/epoch" "${pkgdir}/usr/share/java"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/java/epoch/epoch" "${pkgdir}/usr/bin/epoch"
    install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
}
