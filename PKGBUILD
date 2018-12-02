# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
_pkgname=console-solarized
pkgname=console-solarized-git
pkgver=r17.g26929b5
pkgrel=1
pkgdesc="A Solarized colorscheme for the Linux console"
arch=('any')
url='https://github.com/adeverteuil/console-solarized'
license=('MIT')
backup=('etc/systemd/system/getty@.service.d/solarized.conf'
        'etc/console-solarized.conf')
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/adeverteuil/console-solarized.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"
    cp COPYING "${pkgdir}/usr/share/licenses/${_pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    cp console-solarized "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/etc/systemd/system"
    cp console-solarized@.service "${pkgdir}/etc/systemd/system"

    sed -i -e \
        's#/usr/local/bin/console-solarized#/usr/bin/console-solarized#g' \
        "${pkgdir}/etc/systemd/system/console-solarized@.service"

    mkdir -p "${pkgdir}/etc/systemd/system/getty@.service.d"
    cp solarized.conf "${pkgdir}/etc/systemd/system/getty@.service.d"

    cp console-solarized.conf "${pkgdir}/etc"
}
