# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.27.7
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-colorlog' 'python-ffmpeg-progress-yield' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('4395dc95ff7e733260d12872d73a848154ed00b27658316b4f9f0c5a40326e7e9cc4a89b44c28d31a3dba9f42ae76920a37a6524436bc6257dc720acebda9817')

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
