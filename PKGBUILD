# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.7.4
pkgrel=2
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-setuptools' 'python-tqdm')
checkdepends=('ffmpeg' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('8d38230ffedf2082b453bc989d3ae6bef00db3648d29d81316f2a91a1ff2c4750996b69755bb507ac99fdd4a081c3b7b422c1468e2968f1c46a07d29112c3241')

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
