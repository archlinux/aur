# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Michael Yeatts <mwyeatts@gmail.com>

pkgname=python38-typing_extensions
pkgver=4.4.0
pkgrel=1
pkgdesc='Backported and Experimental Type Hints for Python 3.7+'
arch=(any)
url=https://github.com/python38/typing_extensions
license=(custom)
depends=(python38)
makedepends=(git python38-build python38-flit-core python38-installer)
checkdepends=(python38-tests)
provides=(python38-typing-extensions)
conflicts=(python38-typing-extensions)
source=("git+${url}.git#tag=${pkgver}")
b2sums=(SKIP)

build() {
  cd typing_extensions

  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd typing_extensions

  python3.8 -m unittest discover src
}

package() {
  cd typing_extensions

  python3.8 -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  ln -s "${site_packages}"/typing_extensions-${pkgver}.dist-info/LICENSE \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 et:
