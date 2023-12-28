# Maintainer: Bitals <me at bitals dot xyz>\
pkgname=docker-autocompose-git
pkgver=r71.2e6a55f
pkgrel=1
pkgdesc='Generate a docker-compose yaml definition from a running container'
arch=('any')
url='https://github.com/Red5d/docker-autocompose'
license=('unknown')
depends=(
    'python-pyaml>=20.4.0'
    'python-docker>=4.4.4'
    'python-six>=1.16.0'
)
conflicts=('docker-autocompose')
makedepends=('python-setuptools')
source=($pkgname::git+https://github.com/Red5d/docker-autocompose.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    cd "$pkgname"
    python setup.py install --root "$pkgdir" --optimize=1
}
