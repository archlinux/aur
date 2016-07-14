# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=gym
pkgname=python2-${_gitname}-git
pkgver=r367.df31701
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com"
license=('MIT')
depends=('python2' 'python2-numpy>=1.10.4' 'python2-requests>=2.0' 'python2-six')
makedepends=('git')
optdepends=(
  'python2-atari_py: Atari environment'
  'python2-pachi_py: Go environment'
  'python2-pybox2d: Box2D environment'
  'python2-doom_py: Doom environment'
  'python2-mujoco_py: Physics-based environment'
  'python2-theano: Parameter tuning'
  'python2-keras: Parameter tuning'
)
source=("git+https://github.com/openai/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
