# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=4.4.7
pkgrel=1
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=('python-setuptools')
depends=('imagemagick' 'tk' 'python-pillow' 'python-wand' 'python-ttkbootstrap')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        0001-fix-character-in-setup.py-entrypoint-gui_script.patch
        $pkgname.desktop)
sha256sums=('958e54feef5acf4d536325eda86b349d825bd4c4593fcdf673892ee77dfecd40'
            'fff5a43a08c5c5ef2483dafff22c749527c4f392645cf9517621a9dbc6ec00b3'
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
    install -Dvm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
