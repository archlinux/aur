# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=5.3.0
pkgrel=1
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=('imagemagick' 'tk' 'python-pillow' 'python-wand' 'python-ttkbootstrap' 'python-requests' 'python-findsystemfontsfilename' 'python-pyperclipimg' 'python-darkdetect' 'xclip')
license=('MIT')
arch=('any')
source=("https://github.com/TeaM-TL/${_name}/archive/refs/tags/$pkgver.tar.gz"
        $pkgname.desktop)
sha256sums=('01d4ed93fc2ca3c738f32c2de478526774dcad7036ad0d02a32a27fedaea9687'
            '8f6610e5b14c7ecc3d099b6c03ee2ea638b6080d625d4d7ed2e6baa95daaf1c2')

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
