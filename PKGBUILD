# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.27.3
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-colorlog' 'python-ffmpeg-progress-yield' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('d13dea89e30a55beac7e28b494a86309c653332e8a969860d3f5ca46c43fd2a00e145a1de8b6f2f72eba9a041fcfb4bc332183baaec44ef2a2841ea0ce006854')

prepare() {
#Fix: round percentage in test
#Source: https://github.com/slhck/ffmpeg-normalize/pull/234
    sed -i 's/100.0%/100%/g' "$pkgname-$pkgver"/test/test.py
}
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
