# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-pypemicro-git
_pkgname=${pkgname%-git}
_gitname=${_pkgname#python-}
pkgver=v0.1.3.r11.gfb27759
pkgrel=1
pkgdesc="Python PEMicro debug probes support"
arch=('any')
url="https://github.com/nxpmicro/pypemicro"
license=('BSD')
makedepends=('git'
             'python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"

  python setup.py install --root="$pkgdir" --optimize=1
}

