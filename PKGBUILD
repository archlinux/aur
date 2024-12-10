# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=5.1.2
pkgrel=1
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=('imagemagick' 'tk' 'python-pillow' 'python-wand' 'python-ttkbootstrap' 'python-requests' 'python-findsystemfontsfilename')
license=('MIT')
arch=('any')
source=("https://github.com/TeaM-TL/${_name}/archive/refs/tags/$pkgver.tar.gz"
        0001-fix-character-in-setup.py-entrypoint-gui_script.patch
        $pkgname.desktop)
sha256sums=('d2036f31e03d48747782c70f2d0b28fe1fae2811decb647c8cf5ac1e12a08022'
            'e86029fc9075960ac0819d1958b77c1cee49aca7e842c266e63de1538b28faea'
            '8f6610e5b14c7ecc3d099b6c03ee2ea638b6080d625d4d7ed2e6baa95daaf1c2')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/0001-fix-character-in-setup.py-entrypoint-gui_script.patch"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dvm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
