# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgname="doi2bib"
pkgver=0.4.0
pkgrel=2
pkgdesc="Generate a bibtex given a doi"
arch=('any')
url="https://github.com/bibcure/${pkgname}"
license=('MIT')
depends=('python' 'python-bibtexparser' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('272458eb88a34ab0fd4c69c6a4f2698496ccd9791d827f52b6c2b3ae6a3a221c')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/LICENSE" "LICENSE"
}
