# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.26.0
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-ffmpeg-progress-yield')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('3fe2e3f2772923c502312aaacbd86f5643219bcac9e1ce907623dbbeabdcb26ef5a5a43a8f31d04dd43dd78116f124b57ff390cd21755f215dc9232af613edc5')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}
check() {
  cd "${pkgname}-${pkgver}"
  pytest test/test.py
}
package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
