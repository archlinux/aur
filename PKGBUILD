# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=3.4.0
pkgrel=1
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=('python')
depends=('imagemagick' 'python-configparser' 'python-tkcolorpicker')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        make-executable.patch
        $pkgname.desktop)
sha256sums=('6aad20db071d74e95bd3a561efee5e260dedbefc4edc8c3b01449ac93fd9df70'
            '4eeef4372c7b584f52f3fa1cc095be34f0ef7f4cd6937d95a0adc2258ca1e817'
            '8f6610e5b14c7ecc3d099b6c03ee2ea638b6080d625d4d7ed2e6baa95daaf1c2')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/../make-executable.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dvm644 ../../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
