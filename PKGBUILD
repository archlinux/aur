# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=3.5.0
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
sha256sums=('50a19dc2978a1fbea43d6e596bc7eebe0a79112d2f69e757d680dba033022b9f'
            'dfa1a441df3b07ce5eeaf72d674df71cd09718e88f7c4ed25f1d614f02110a79'
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
