# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Leo Mao <leomaoyw at gmail dot com>

pkgname=python-gym
_pkgname=gym
pkgver=0.23.0
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com/"
license=('MIT')
depends=('python-scipy' 'python-numpy' 'python-six' 'python-pyglet' 'python-cloudpickle')
optdepends=('python-atari-py' 'python-pillow' 'python-opengl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/openai/gym/master/LICENSE.md")
b2sums=('77f54ff017f0ba495ad0b06e097dd01ec58f372e4dad8daed0206e044c2b191415168c2f4a892c0db97dc39a55f85a9fed47c60d7b5cabeb87af2b3badbc44a4'
        '8d39c5fdf160392eb735ae19d5dcb9227c32d6ead9aa9b0f9b59b0b45be63c42412da9b0c97cc7f33a24b16fdcd982f470dab65742849d229f6e43b2d845e758')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
