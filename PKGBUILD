# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.27.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-setuptools' 'python-wheel')
depends=('python' 'python-attrs' 'python-colorama' 'python-junit-xml' 'python-requests' 'python-ruamel-yaml' 'python-tqdm' 'python-packaging' 'python-jsonschema')
provides=('semgrep')
options=('!strip')
source=(
  "https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz"
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=('79dee3b382b634623c3f32a835c2257a131c97022a824c318aee487619030b2e'
            '3229b1bd653d2bb66dce15d01eebae17053cc40c2dac2997668e7468416faba3')
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}"
  find semgrep-files -type f -exec install -D '{}' "${pkgdir}/usr/lib/{}" \;

  cd "${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
