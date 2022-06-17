# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Leo Mao <leomaoyw at gmail dot com>

pkgname=python-gym
_pkgname=gym
pkgver=0.24.1
pkgrel=3
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com/"
license=('MIT')
depends=('python-scipy' 'python-numpy' 'python-six' 'python-pyglet' 'python-cloudpickle')
optdepends=('python-ale-py' 'python-pillow' 'python-opengl')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/openai/gym/${pkgver}/LICENSE.md")
b2sums=('80e5dbb2eec28c2b80fb24199f98f18004a602fdf1be243f143034c65b842bc0d49337d036530326ed64b619ebbd5fc856a30010a9bb3837cc2eae61fb115a58'
        '26bc4de9e957160dbc9d218a8bf7304cd64ebe6c3037b171ee2657424a76279f27438598e48a476ed625be129310fa12b0b084ea2ddf92156f9522458e999c7b')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE-${pkgver}.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
