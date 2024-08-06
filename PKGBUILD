# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="timg"
pkgname="python-${_name}"
pkgver=1.1.5
pkgrel=1
pkgdesc="Display an image in terminal"
arch=('any')
url="https://github.com/adzierzanowski/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('python' 'python-pillow')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1f1ac80e206b212be026d9584754559bf0a1df7069355f6ea7b7e2fe9f9646dc')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
