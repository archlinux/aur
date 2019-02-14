# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dynwg'
pkgname="${_pkgbase}-git"
pkgver=latest
pkgrel=2
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'wireguard-tools' 'iputils')
makedepends=('git')
source=("${_pkgbase}::git+${url}.git")
md5sums=('SKIP')
pkgdir='pkg'
srcdir='src'


pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm 755 dynwg.py "${pkgdir}/usr/bin/dynwg"
    install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dynwg.service "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dynwg.timer "${pkgdir}/usr/lib/systemd/system"
}
