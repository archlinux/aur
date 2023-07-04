# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>

_py=python
_pkg=wokkel
_pkgname="${_py}-${_pkg}"
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
)
pkgver=0.7.1.r45.g9df5060
pkgrel=1
pkgdesc="Twisted Jabber support library - git version"
license=(
  'custom:"Wokkel License"'
)
url="http://${_pkg}.ik.nu/"
_ns="ralphm"
_url="https://github.com/${_ns}/${_pkg}"
arch=(any)
makedepends=(
  'git'
  "${_py}-setuptools"
)
_branch="remove-py2-compat"
source=("${_pkgname}::git+${_url}#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-wokkel-git() {
  depends=(
    "${_py}-twisted"
  )
  replaces=(
    "${_pkgname}-hg"
  )
  provides=(
    "${_pkgname}=0.8")
  conflicts=(
    "${_pkgname}"
    "${_pkgname}-hg"
  )
 
  cd "${_pkgname}"
  "${_py}" setup.py install --root="$pkgdir/" \
                            --optimize=1
  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

