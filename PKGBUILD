# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=gym
pkgname=python-${_gitname}-git
pkgver=r1034.f380a0e8
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com"
license=('MIT')
depends=(
  'python'
  'python-numpy>=1.10.4'
  'python-pyglet'
  'python-requests>=2.0'
  'python-six'
)
makedepends=('git')
provides=('python-gym')
source=("git+https://github.com/openai/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
