# Maintainer: fkobayashi <see name left ＠ 数学 (but in english) dot ubc.ca

pkgname=plom
pkgver=0.5.16
pkgrel=1
pkgdesc="Paperless open marking."
arch=('any')
license=('AGPL3')
url="https://gitlab.com/${pkgname}"
depends=(python python-toml python-opencv python-lapsolver python-imutils python-jpegtran-cffi python-requests pyzbar python-aiohttp python-pypng python-peewee python-pyqrcode python-numpy python-tqdm python-pandas python-passlib python-pymupdf python-cffi python-pyqt5 python-requests-toolbelt python-appdirs python-weasyprint python-scikit-learn python-pillow)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('efe3171afd9d254c3b52b8cde74edb3cc219c7b96d11c10a94dce05f8176e93e')


build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root $pkgdir || return 1

  install -Dm644 LICENSE.md \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
