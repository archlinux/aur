# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-xml
pkgname=python-$_name
pkgver=0.1.0
pkgrel=1
pkgdesc='XML serialization and deserialization support for Smithy tooling.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/smithy-xml"
license=('Apache-2.0')
depends=('python' 'python-smithy-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-freezegun')
source=("$_name::git+$_repo.git#tag=$_name/v$pkgver")
sha256sums=('6062c931f1e01c738ca7672a37df37982dfbd470f268b081055a8b65e8124d1f')

build() {
  cd "$srcdir"/$_name/packages/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "$srcdir"/$_name/packages/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
