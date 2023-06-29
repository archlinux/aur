# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

_py=python2
_pkg=whois
_name="py${_pkg}"
_pkgname="python-${_pkg}"
pkgbase="${_pkgname}"
pkgname=(
  "${_py}-${_pkg}"
  "python-${_pkg}")
pkgver=0.8.0
pkgrel=1
pkgdesc="Whois querying and parsing of domain registration information"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
url="https://bitbucket.org/richardpenman/${_name}"
license=( 'CUSTOM' )
depends=(
  "${_py}"
  "python"
)
makedepends=(
  "python"
  "python-setuptools"
  "${_py}-setuptools"
)
install=
changelog=
noextract=()
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
_pypi_repo="https://files.pythonhosted.org/packages/source"
source=(
  "${_pypi_repo}/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE"
)
sha512sums=(
  '17c7d5aae8f4a3b460222137c944bda60d42692a01983e70edf316ea16e7210922cb8baf6cc94d912716582a880df80a4c9d2a83aa88db73a9011b2b3117273c'
  '8cf4065e880c751354fffe41f513b95c6bad6bd28033d7a660bd52636cae0c313f9b60f4c53234320699fc0b44d9e4b42bb06f543733b41e0de07a68068099d1'
)

package_python-whois() {
  depends=(
    'python'
    'python-future'
)
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" \
                          --optimize=1
  install -Dm 0644 ${srcdir}/LICENSE \
          "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

package_python2-whois() {
  local _site_packages
  _site_packages="$(python2 -c 'import site; print site.getsitepackages()[0]')"
  depends=(
    "${_py}"
    "${_py}-futures"
  )
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH="${_site_packages}" \
    "${_py}" setup.py install --root="${pkgdir}" \
                              --optimize=1
  install -Dm 0644 ${srcdir}/LICENSE \
          "${pkgdir}/usr/share/licenses/${_py}-${_pkg}/LICENSE"
}
