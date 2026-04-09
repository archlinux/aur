# Maintainer: phlppbmm <philipp.baumm@gmx.net>
pkgname=python-agent-rtfm-bin
pkgver=0.1.1
pkgrel=5
pkgdesc="Local documentation retrieval service for agent-assisted development (prebuilt)"
arch=('any')
url="https://github.com/phlppbmm/rtfm"
license=('MIT')
depends=('python>=3.11')
makedepends=('uv' 'python-installer')
provides=('python-agent-rtfm')
conflicts=('python-agent-rtfm' 'python-agent-rtfm-git')
options=('!strip')

build() {
    uv pip download \
        --dest="${srcdir}/wheels" \
        "agent-rtfm==${pkgver}"
}

package() {
    for whl in "${srcdir}/wheels/"*.whl; do
        python -m installer --destdir="${pkgdir}" "$whl"
    done
}
