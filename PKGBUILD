# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>
pkgname=('python-pulse-control-git' 'python2-pulse-control-git')
pkgver=r146.0d14c59
pkgrel=1
pkgdesc="Python bindings for pulseaudio"
arch=('any')
url="https://github.com/mk-fg/${pkgname%-git}"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
license=('MIT')
source=("${pkgname}::git+https://github.com/mk-fg/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/python-pulse-control-git"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cp -r python-pulse-control-git python2-pulse-control-git

  cd python-pulse-control-git
  python ./setup.py build

  cd ../python2-pulse-control-git
  python2 ./setup.py build
}

package_python-pulse-control-git() {
  depends=('python' 'pulseaudio')

  cd python-pulse-control-git

  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pulse-control-git() {
  depends=('python2' 'pulseaudio')

  cd python2-pulse-control-git

  python2 setup.py install --root="$pkgdir" --optimize=1
}


