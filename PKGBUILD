# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <setthawut DOT a AT protonmail DOT com>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
provides=('ffmpeg-progress-yield')
conflicts=('ffmpeg-progress-yield')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('abbcb71d6b328d6c4b9182a885fb1ef114f00aa9b52b091f79e9e0f15d4d93400914094dd70330b622c31e4cec4dcd7d90f1713658dc0ab73ffec9a149a10d7c')

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
