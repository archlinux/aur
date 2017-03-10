# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=rainbow-git
pkgver=2.5.0.219.b61ce75
pkgrel=1
pkgdesc="Colorize commands output or STDIN using patterns."
arch=(any)
url="https://github.com/nicoulaj/rainbow"
license=(GPL3)
depends=(python)
makedepends=('git' 'python-setuptools')
changelog=Changelog
provides=(rainbow)
conflicts=(rainbow)
source=("${pkgname}::git+https://github.com/nicoulaj/rainbow")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
                    "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgbase}
  python setup.py build
}

package() {
  cd ${pkgbase}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

