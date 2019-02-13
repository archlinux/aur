# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dynwg'
pkgname="${_pkgbase}-git"
pkgver=r4.9cfacd6
pkgrel=2
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'python-docopt' 'wireguard-tools' 'iputils')
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
    install -Dm 755 dynwgd.py "${pkgdir}/usr/bin/dynwgd"
    install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dynwg@.service "${pkgdir}/usr/lib/systemd/system"
}
