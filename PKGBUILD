# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-dacite'
_name=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="Simplify creation of data classes (PEP 557) from dictionaries."
url="https://github.com/konradhalas/dacite"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        )
sha512sums=('747c8566b5ea6d68234fe8715d0a926ac9a916693e824841ee00338a3e1fbaac0632567b03f20cd6425a18facb434b9f3671a47a1f8d6d2a78aed8767d0d7f3f'
            )
noextract=("${_name}-${pkgver}-py3-none-any.whl")

package() {
  # Source package is not available on PyPI; use provided wheel package instead.
  python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}-py3-none-any.whl"

  # Symlink license file (cf. PKGBUILD for python-black)
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
