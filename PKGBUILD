# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='dyndnswatch'
pkgname="${_pkgbase}-git"
pkgver=r21.3b702d4
pkgrel=1
pkgdesc='A simple, lightweight DynDNS watchdog'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3' 'MIT')
depends=('python' 'python-docopt')
makedepends=('git' 'python')
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
    install -Dm 755 dyndnswatchd "${pkgdir}/usr/bin/dyndnswatchd"
    install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m 644 dyndnswatch.service "${pkgdir}/usr/lib/systemd/system"
}
