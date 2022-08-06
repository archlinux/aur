# Maintainer:   Sian1468 <sian1468-aur@.39011468.xyz>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.24.0
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=('ffmpeg' 'python-ffmpeg-progress-yield')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('27e1e0f87431e0c02a82b3542f35f7a7afd07d4cc6c80dacf36d30296335f53d31921346e913f61b86c5f3c0c028388fbbc716071223b8de01e834bd6b45dfb7')

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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
