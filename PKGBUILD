# Maintainer: Giosuel <arch@giosuel.ch>
pkgname=python-networklab
_name=networklab
pkgver=26.11
pkgrel=1
pkgdesc='netlab: CLI-based virtual networking lab abstraction layer'
arch=('any')
url='https://netlab.tools'
license=('MIT')
depends=(
    'python'
    'python-box'
    'python-filelock'
    'python-jinja'
    'python-netaddr'
    'python-packaging'
    'python-requests'
    'python-rich'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
    'ansible: configure devices that use Ansible'
    'containerlab: run network devices as containers'
    'python-netmiko: configure devices that use Netmiko'
    'sshpass: connect to devices with passwords'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha256sums=('206563b276251c3d327deb591aeefb0b346ebecaec693fe344ec98092d980879')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
