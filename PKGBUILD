# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_upstreamver='0.8.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-tags'
_repo='zulip/python-zulip-api'


pkgname='python-zulip-api'
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Pyhton bindings for Zulip API."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/${_repo}"
license=('GPL')
depends=(
    'python'
    'python-requests'
    'python-pyopenssl'
    'python-six'
    'python-distro'
    'python-click')
optdepends=(
    'python-matrix-client-git: For zulip matrix bridge')
makedepends=('cython' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('257f2bf9fe5caa6b8fd424a4c8549444521f09b918e50bace614295a943aac82')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py install --root="${pkgdir}" --optimize=1
}
