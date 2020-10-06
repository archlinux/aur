# Maintainer: Phylor <phylor at gmail dot com>
pkgname=ledgerhelpers
pkgver=v0.3.1.r7.580a2cb
pkgrel=1
pkgdesc="A collection of helper programs and a helper library for Ledger (ledger-cli)"
arch=('any')
url="https://github.com/Rudd-O/ledgerhelpers"
license=('unknown')
groups=()
# Since ledger-3.2.0 the package builds python support. Before that version it was necessary to use ledger-git.
depends=('python' 'python-setuptools' 'ledger')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
#source=('git+https://github.com/Rudd-O/ledgerhelpers#tag=v0.3.1')
source=('git+https://github.com/phylor/ledgerhelpers')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-VCS}"
        printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
        cd "$srcdir/${pkgname%-VCS}"
        python setup.py build
}

package() {
        cd "$srcdir/${pkgname%-VCS}"
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
