# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname='sherlock'
pkgname="${_pkgname}-git"
pkgver=501cb3dce27494265a0993335dab517070dadab5
pkgrel=1
pkgdesc='Hunt down social media accounts by username across social networks'
arch=('any')
url='https://github.com/sherlock-project/sherlock'
license=('MIT')
depends=('python'
        'python-certifi'
        'python-colorama'
        'python-openpyxl'
        'python-pandas'
        'python-pysocks'
        'python-requests'
        'python-requests-futures'
        'python-torrequest'
        'python-stem'
        'python-torrequest')
makedepends=('git' 'python-setuptools' 'python-installer' 'python-wheel' 'python-build')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'docs/removed-sites.md' 'docs/README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
