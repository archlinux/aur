# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'perl')
conflicts=('epoch-nighly-bin')

source=("https://github.com/lf-lang/epoch/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/epoch/v${pkgver}/LICENSE")
sha512sums=('28112627c085a18c6af7a14e53a13cc81f15d74ae1ce99114fa0bb1ded2167134f2db27eb1db4a733e99432b9515faa6350e861e618794f5e39fdba78ad9de38'
            '477af45f047a9c7735385ecae2a7c34f4b009481c2f5ce7efbe7251f59ad979fd3e8303c4079b2455a05502654a28f3aa33c6754e3d004f2e9117515c24eeb50')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch/LICENSE"

    install -dm755 "${pkgdir}/usr/share/java/epoch"
    cp -r "${srcdir}/epoch" "${pkgdir}/usr/share/java"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/java/epoch/epoch" "${pkgdir}/usr/bin/epoch"
    install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
}
