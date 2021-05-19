# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_gitname=ConfigArgParse
_basename=python-configargparse
pkgname=${_basename}-git
pkgver=1.4.1
pkgrel=2
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=('any')
url="https://github.com/bw2/${_gitname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-yaml: for YAML support')
provides=(${_basename})
conflicts=(${_basename})
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}
  git describe --tags | sed 's/-/+/g;s/v//;'
}

build() {
  cd ${_gitname}
  python setup.py build
}

package() {
  cd ${_gitname}

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
