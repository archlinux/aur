# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.7.6
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-setuptools' 'python-tqdm')
optdepends=('ffmpeg: command line mode')
checkdepends=('ffmpeg' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('5ab9c3812572d7c99da4e68922e100832d462bab78745549c99491cfae1de207b30173dec6c26cca7d17e19fd5d15a1e0903838db1241c3c1747a4868265f147')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}
check() {
  cd ${_name}-${pkgver}
  pytest test/test.py
}
package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
