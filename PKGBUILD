# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Tom Krizek <tkrizek@isc.org>

pkgname=python-dnspython-git
pkgver=2.1.0.r760.b2f09a92
pkgrel=1
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('ISC')
depends=('python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'git'
    'python-build'
    'python-hatchling'
    'python-installer'
    'python-wheel'
)
checkdepends=('python-idna' 'python-cryptography' 'python-trio' 'python-pytest')
optdepends=(
    'python-cryptography: DNSSEC support'
    'python-requests-toolbelt: DoH support'
    'python-idna: support for updated IDNA 2008'
    'python-curio: async support'
    'python-trio: async support'
    'python-sniffio: async support'
)
source=("git+https://github.com/rthalley/dnspython.git")
sha256sums=('SKIP')

pkgver() {
    cd dnspython
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd dnspython
    python -m build --wheel --no-isolation
}

check() {
    cd dnspython
    pytest
}

package() {
    cd dnspython
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
