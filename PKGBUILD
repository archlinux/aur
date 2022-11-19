# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>

_name=PyYAML
pkgname=python38-yaml
pkgver=6.0
pkgrel=1
pkgdesc='Python bindings for YAML, using fast libYAML library'
arch=(x86_64)
url='https://pyyaml.org/wiki/PyYAML'
license=(MIT)
depends=(libyaml python38)
makedepends=(cython python38-setuptools)
provides=(python38-pyyaml)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('b402993073282e7f4202823b051d364b91929362edd5b3aebe93b56833956ec9279c1ba82b97f8bc8a2b82d20e1060e4ec9fc90400a6ed902adce3e4f83a6e0e')
b2sums=('00a871f6a6ea8b0a3f7aec4279b03e102af2c2b75ce45f2bcf68584f67843b2a0b37113bd431c73d9c84b2abaaf48bd97163aa970074afb8e7ef04247938f271')

build() {
  cd $_name-$pkgver
  python3.8 setup.py --with-libyaml build
}

check() {
  local _py_ver="$(python3.8 -c "import sys; print(str(sys.version_info.major)+'.'+str(sys.version_info.minor))")"

  cd $_name-$pkgver
  export PYTHONPATH="tests/lib:build/lib.linux-$CARCH-$_py_ver:$PYTHONPATH"
  python3.8 -m tests.lib.test_all
}

package() {
  cd $_name-$pkgver
  python3.8 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 CHANGES README.md -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim: ts=2 sw=2 et:
