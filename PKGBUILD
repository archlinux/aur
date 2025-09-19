# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_name="spin"
pkgname="python-${_name}"
pkgver=0.15
pkgrel=1
pkgdesc="A developer tool for scientific Python libraries"
arch=('any')
url="https://github.com/scientific-python/spin"
license=('BSD-3-Clause')
depends=(
  "python>=3.9"
  "python-click"
  "python-importlib-metadata"
)
makedepends=(
  "git"
  "python-setuptools"
  "python-build"
  "python-installer"
  "python-wheel"
)
optdepends=(
  "python-pygments: For syntax highlighting"
  "python-pytest: For running the unit-tests"
)
source=("${_name}::git+${url}#tag=v${pkgver}")
b2sums=('dbfe9700bfa9365ce67bb42a40ad405b52e321d46f864c0639112f2761cfa1115385c97e3e5d897bbfa0840eb8baf0019f87728a57882c37add9bcefa6fd8b8e')

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim: sw=2 ts=2 et:
