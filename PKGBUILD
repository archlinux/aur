# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
_pkgname=gdb-frontend
pkgver=0.11.0.beta
_pkgver=0.11.0-beta
pkgrel=5
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://github.com/rohanrhu/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
makedepends=('python-setuptools' 'gendesk')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('cc4ada6d8466e36049e6a7dccbc2b8fa24ed0d7a355dbb941f05ed06ede221aa')

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