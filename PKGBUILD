# Maintainer: Alessandro Pazzaglia <jackdroido@gmail.com>

pkgname=scuba-git
pkgver=v2.10.1.r43.c6f3e62
pkgrel=1
pkgdesc="SCUBA is a simple tool that makes it easier to use Docker containers in everyday development"
arch=('any')
url="https://github.com/JonathonReinhart/scuba"
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-yaml')
source=('scuba-git::git+https://github.com/JonathonReinhart/scuba.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  git -C "${srcdir}/${pkgname%-VCS}" clean -dfx
}

build() {
    cd "$srcdir/${pkgname%-VCS}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
