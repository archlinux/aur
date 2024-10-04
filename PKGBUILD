# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=safe-netrc
pkgname=python-${_name}
pkgver=1.0.1
pkgrel=1
pkgdesc="Safe netrc file parser"
arch=('any')
url='https://git.ligo.org/computing/software/safe-netrc'
license=('GPL-2.0-or-later')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-setuptools-scm' 'python-build' 'python-installer')
source=("safe-netrc-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/safe-netrc-v${pkgver}.tar.gz")
sha256sums=('1a5da11017812efc83bceaeb249244b0f90ee9c708fa5a228bf6c3ee70d5978e')

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    cd ${_name}-v${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-v${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
