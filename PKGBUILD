# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
_pkgname=gdb-frontend
pkgver=0.11.1.beta
_pkgver=0.11.1-beta
pkgrel=1
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://github.com/rohanrhu/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
makedepends=('python-setuptools' 'gendesk')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('2c407aa89e89e8d0abc0a103050123fc5a9eb98e74848bf6150f14bc082971b1')

prepare() {
    gendesk -n \
    --pkgname "${_pkgname}" \
    --exec="gdbfrontend" \
    --name="GDBFrontend" \
    --pkgdesc "GDBFrontend is an easy, flexible and extensionable gui debugger" \
    --terminal=true
}

build() {
    cd "${_pkgname}-${_pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${_pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}-${_pkgver}/frontend/images/bug.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}