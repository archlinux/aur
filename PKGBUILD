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
)
sha512sums=('23e4135d5657da91e27d69b30efd5ffbc4a0b99febb72973aece132be11b9e7d59de6383c93cc1044af3145661623dd48448039d21a48397134e23991be4f6a4')

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
    cd "$srcdir/$pkgname-$pkgver"
    install -D ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 completions/${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
