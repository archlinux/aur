# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=hostman
pkgname=${_pkgname}-bin
pkgver=1.2.4
pkgrel=2
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedeps=('xdelta3')
depends=('cjson' 'sqlite' 'openssl' 'curl' 'glibc' 'ncurses')

changelog="changelog.md"

source=("fix_libncurses_x86_64.patch")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.gz")
sha256sums=('6d76a4bb970edd2445b34d69fd8e2d4c237aa59761f861da0ca75a20d922d852')
sha256sums_x86_64=('bb7163caea112f42727cd968329ef00a8d1c46ea415b879f5e7ec0152ebc5fc6')

prepare() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    xdelta3 -d -f -s "${_pkgname}" "../fix_libncurses_x86_64.patch" "${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}-linux-x64" || exit

    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
