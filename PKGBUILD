# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=try
pkgver=0.2.0
pkgrel=3
pkgdesc="Try lets you run a command and inspect its effects before changing your live system"
arch=('any')
url="https://github.com/binpash/try"
license=('MIT')
depends=('bash')
provides=('try')
source=(
"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
"$url/releases/download/latest/try.1"
)
sha512sums=('23e4135d5657da91e27d69b30efd5ffbc4a0b99febb72973aece132be11b9e7d59de6383c93cc1044af3145661623dd48448039d21a48397134e23991be4f6a4'
            'ac5f4f30274ee0387cc5e7d4cbd8c9662ccf15a305e67b66b57e382b1b2a4ba89d51fba7bb2a5f520082595205c74349a7eec3eb44a8dd8809d9a2f294a4db08')

#create man page
# Pandoc-cli require too many packages as dependecy
# will be download directly from source
# see: https://github.com/binpash/try/issues/61
#prepare() {
#    #make -C man try.1
#}

check() {
    cd $srcdir/$pkgname-$pkgver
    scripts/run_tests.sh
}

package() {
    install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    cd "$srcdir/$pkgname-$pkgver"
    install -D ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 completions/${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
