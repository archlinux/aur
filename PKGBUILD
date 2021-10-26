# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=python-yaml-git
pkgver=6.0.r0.g8cdff2c
pkgrel=2
pkgdesc='Python bindings for YAML, using fast libYAML library'
url='https://pyyaml.org/wiki/PyYAML'
arch=('any')
license=('MIT')
depends=('python' 'libyaml')
makedepends=('python-setuptools' 'libyaml' 'cython')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/yaml/pyyaml.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  (
    cd ${pkgname%-git}
    python setup.py --with-libyaml build
  )
}

check() {
  (
    cd ${pkgname%-git}
    python -B setup.py test
  )
}

package() {
  cd ${pkgname%-git}
  python setup.py  --with-libyaml install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 CHANGES README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:
