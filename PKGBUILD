# Maintainer: nightuser <nightuser.android@gmail.com>

pkgname=podman-compose-git
pkgver=0.1.6dev.r41.efcbc75
pkgrel=1
pkgdesc="A script to run docker-compose.yml using podman"
arch=('any')
url="https://github.com/containers/podman-compose"
license=('GPL2')
depends=('podman' 'python-yaml')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/containers/podman-compose#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s.%s" \
    "$(python -c 'from podman_compose import __version__; print(__version__)')" \
    "$(git describe --long | sed -e "s/^$(git describe --abbrev=0)-//" -e 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
