# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
makedepends=('python-setuptools')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('87b043dfabaac21088dd6069cf5dfc82f3d823734b7434b8a30eb9c224bbc1440b17a7dc689631a3931e4765aec34e2dfd6e7b6bb845d3fa2952200acacd20bd')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}
check() {
  cd "${_name}-${pkgver}"
  python test/test.py
}
package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
