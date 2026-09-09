# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Contributors below are credited from the original sherlock-git PKGBUILD
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: peeweep <peeweep at 0x0 dot ee>

_pkgname='sherlock'
pkgname="${_pkgname}"
pkgver=0.16.2
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
        'python-stem'
        'python-tomli')
makedepends=('python-installer' 'python-build' 'python-poetry-core' 'python-setuptools')
conflicts=('sherlock-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5888c02c0fb79caf3e1612c8ee2deef59ca9797f6fffa8e597cf094af9e74b10')

build() {
    cd "$srcdir"/sherlock-"$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/sherlock-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'docs/removed-sites.md' 'docs/README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

