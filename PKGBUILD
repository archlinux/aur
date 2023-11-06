# Maintainer:
# Contributor: Brenden Davidson <davidson.brenden15@gmail.com>

_module="webpy"
_pkgname="python-$_module"
pkgname="$_pkgname"
pkgver=0.70
pkgrel=1
pkgdesc="A web framework for Python"
arch=("any")
#url="https://webpy.org/"
url="https://github.com/webpy/webpy"
license=('Public Domain')

depends=(
  'python'
  'python-cheroot'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

#_tag="${pkgver%%.r*}"
_tag="$_module-${pkgver%%.r*}"
_pkgsrc="$_module-$_tag"
_pkgext="tar.gz"
source=(
  "$_module-${pkgver%%.r*}.$_pkgext"::"$url/archive/refs/tags/$_tag.$_pkgext"
)
sha256sums=(
  "eee36e423b5e85463145159d94735e3c3a4c1c8078555042d8139348350b0022"
)

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl

  install -Dm644 "LICENSE.txt" "${pkgdir:?}/usr/share/licenses/${pkgname:?}/LICENSE"
}
