# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgname=python2-yaml
pkgver=5.4.1.1
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
url='https://pyyaml.org/wiki/PyYAML'
arch=('x86_64')
license=('MIT')
depends=('python2' 'libyaml')
makedepends=('python2-setuptools' 'cython2')
source=(pyyaml-${pkgver}.tar.gz::https://github.com/yaml/pyyaml/archive/${pkgver}.tar.gz)
sha512sums=('bcbe911fbef7e6e8ef8a76293593d4d792dbbf0931a2d031cdeacddf7064b69f958484217bc60d1b7614dcc83ef56cd5c0cd48a0339ab9add623ef70cb2d0a20')

build() {
  (
    cd pyyaml-$pkgver
    python2 setup.py --with-libyaml build
  )
}

check() {
  (
    cd pyyaml-$pkgver
    python2 -B setup.py test
  )
}

package() {
  cd pyyaml-$pkgver
  python2 setup.py  --with-libyaml install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 CHANGES README -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:

