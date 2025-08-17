# Maintainer information
# Maintainer: Seth Mackert <seth.mackert@fastsycamore.com>

# Core package metadata from your pyproject.toml
pkgname=kshift
pkgver=1.2.4
pkgrel=1
pkgdesc="KDE Theme Shift"
arch=('any')
url="https://github.com/justjokiing/kshift"
license=('GPL3')

depends=('python' 'python-click' 'python-colorama' 'python-pydantic' 'python-pyyaml' 'python-requests')

makedepends=('git' 'python-build' 'python-installer')

# The URL is constructed from the pkgname and pkgver.
source=("https://pypi.io/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

# Checksums for the source files.
# The GitHub Action will use `makepkg --printsrcinfo` to automatically
# generate the .SRCINFO file, which contains these checksums.
sha256sums=('SKIP')

prepare() {
  echo "Preparing the source..."
}

# The `build` function. We use python-build to create a wheel file.
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --sdist
}

# The `package` function. This is where we install the built files.
# We use python-installer to install the wheel into the fakeroot environment.
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer dist/*.whl --destdir="${pkgdir}"
}
