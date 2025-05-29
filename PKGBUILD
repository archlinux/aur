# Maintainer: Viking @Vikingfr <https://twitter.com/Vikingfr>
# Maintainer: Mayfly @M4yFly <https://twitter.com/M4yFly>
# Maintainer: Erick Sanchez Vera "T1erno" <erickdeveloper2000@outlook.com>

pkgname=arsenal
pkgver=1.2.7.0.g7fc3af8
pkgrel=1
pkgdesc='Quick inventory and launcher for hacking programs'
url='https://github.com/Orange-Cyberdefense/arsenal'
arch=('any')
license=('GPL')
depends=(
  'python>=3.7'
  'python-libtmux'
  'python-docutils'
  'python-pyperclip'
  'python-yaml'
)
optdepends=('python-pyfzf')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}::git+https://github.com/Orange-Cyberdefense/arsenal.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
  "${srcdir}/arsenal/addalias.sh"
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
