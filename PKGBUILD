# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Contributors below are credited from the original sherlock-git PKGBUILD
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname='sherlock'
pkgname="${_pkgname}"
pkgver=v0.16.0
pkgrel=2
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
makedepends=('python-setuptools' 'python-installer' 'python-wheel' 'python-build' 'python-poetry-core')
conflicts=('sherlock-git')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('997a7c22ed5c179438c91c27e8430b43e1d0fceb79d345e478a390d599a4016f')

build() {
    cd "$srcdir"/sherlock-0.16.0
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/sherlock-0.16.0
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'docs/removed-sites.md' 'docs/README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
