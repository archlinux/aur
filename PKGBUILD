# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sixelcrop"
pkgname="python-${_name}"
pkgver=0.1.9
_commit="f78ae776164f0fe186e7ada12eab1336068a1687"
pkgrel=1
pkgdesc="Crop sixel images in sixel-space"
arch=('any')
url="https://github.com/joouha/${_name}"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('c17acb124be01ba9f91d09b74c66234af4a48193c6d01fcf479530ab2f2fb3af7df2e91c655ad2fa5bdafbaa949e23a77cf5a3f1f4337f4a2100b87b2c0828bb')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
