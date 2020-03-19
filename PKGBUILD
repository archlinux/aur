# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

pkgbase=pypy-yaml
pkgname=(pypy-yaml pypy3-yaml)
pkgver=5.3
pkgrel=1
pkgdesc="Python bindings for YAML, using fast libYAML library"
arch=('i686' 'x86_64')
url="http://pyyaml.org"
license=('MIT')
makedepends=('pypy3' 'pypy')
install='pypy-yaml.install'
source=(http://pyyaml.org/download/pyyaml/PyYAML-$pkgver.tar.gz)
sha256sums=('e9f45bd5b92c7974e59bcd2dcc8631a6b6cc380a904725fce7bc08872e691615')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup PyYAML-$pkgver pypy3PyYAML-$pkgver
}

build() {
  # build for pypy
  cd PyYAML-$pkgver
  pypy setup.py build

  # build for pypy3
  cd ../pypy3PyYAML-$pkgver
  pypy3 setup.py build
}

package_pypy-yaml() {
  depends=('pypy' 'libyaml')
  pkgdesc+=" for Pypy"

  cd PyYAML-$pkgver
  pypy setup.py install --prefix=/opt/pypy --root=$pkgdir
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_pypy3-yaml() {
  depends=('pypy3' 'libyaml')
  pkgdesc+=" for Pypy 3"

  cd PyYAML-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root=$pkgdir
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
