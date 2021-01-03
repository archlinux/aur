# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=3.5.3
pkgrel=3
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=('python-setuptools')
depends=('imagemagick' 'python-configparser' 'python-tkcolorpicker')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        0001-fix-character-in-setup.py-entrypoint-gui_script.patch
        $pkgname.desktop)
sha256sums=('3d40b432488b4ca350ff63ea8e99928b519c8930ec95ced0e0bfe2e3bf104f0f'
            'e0d3b71864705c1dce83f89d674015b7fb5f17c18470c2b78e1635de48a518e6'
            '8f6610e5b14c7ecc3d099b6c03ee2ea638b6080d625d4d7ed2e6baa95daaf1c2')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/0001-fix-character-in-setup.py-entrypoint-gui_script.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dvm644 ../../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
