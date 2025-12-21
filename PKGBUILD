# Maintainer: bastidest <bastidest at mailbox dot org>

_name=FotoKilof

pkgname=${_name,,}
pkgver=5.2.3
pkgrel=1
pkgdesc="GUI for ImageMagick"
url="https://github.com/TeaM-TL/FotoKilof"
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=('imagemagick' 'tk' 'python-pillow' 'python-wand' 'python-ttkbootstrap' 'python-requests' 'python-findsystemfontsfilename' 'python-pyperclipimg' 'python-darkdetect' 'xclip')
license=('MIT')
arch=('any')
source=("https://github.com/TeaM-TL/${_name}/archive/refs/tags/$pkgver.tar.gz"
        $pkgname.desktop)
sha256sums=('f0b334539de07714259d949887370c130ff4b5a0ba83a6b780e12331d1a66cfd'
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
