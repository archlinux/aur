# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=hatch

pkgname=python-hatch
pkgver=0.11.0
pkgrel=1
pkgdesc="A modern project, package, and virtual env manager"
arch=('any')
url="https://github.com/ofek/hatch"
license=('MIT' 'APACHE')
depends=(
  'python-appdirs'
  'python-atomicwrites'
  'python-click'
  'python-colorama'
  'python-coverage'
  'python-pexpect'
  'python-pip>=9.0.1'
  'python-pytest'
  'python-semver>=2.7.8'
  'python-setuptools>=36.0.0'
  'python-sortedcontainers>=1.5.7'
  'python-toml>=0.9.3'
  'twine>=1.9.1'
  'python-userpath>=1.1.0'
  'python-virtualenv'
  'python-wheel>=0.27.0'
)
provides=('python-hatch')
options=(!emptydirs)
source=(
  "https://github.com/ofek/hatch/archive/${pkgver}.tar.gz"
)
sha256sums=(
  '89eb2417503125919f5536b0c50390affa2536b193ddcfc826ad96a4d17e7678'
)

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  # no need to include tests files
  rm tests/__init__.py
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 COMMANDS.rst "${pkgdir}/usr/share/doc/${pkgname}/COMMANDS.rst"
  install -Dm644 CONFIG.rst "${pkgdir}/usr/share/doc/${pkgname}/CONFIG.rst"
  install -Dm644 HISTORY.rst "${pkgdir}/usr/share/doc/${pkgname}/HISTORY.rst"
  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
