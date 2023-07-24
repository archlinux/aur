# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.27.6
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-colorlog' 'python-ffmpeg-progress-yield' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('46b579037273842c9715dbbc4db09990d28f93eb763a0388c2a5998350e893a000c787d0db7712c3f6951399c2ce1c938207975ebc52f4ccf44d8153e5d2affd')

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
