# Maintainer: h_cheung mail@h-cheung.cf
pkgname=clash-scripts
pkgver=20191129.r5.4d0be4a
pkgrel=1
epoch=
pkgdesc="some scripts for clash."
arch=('any')
url="https://github.com/Howard-00/clash-scripts"
license=('GPL3')
groups=()
depends=('clash')
makedepends=('git')
optdepends=('go-tun2socks: udp relay support')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/clash-scripts/env)
options=()
install=
source=("git+${url}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${srcdir}/clash-scripts"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

package() {
  cd ${srcdir}/clash-scripts
  mkdir -p ${pkgdir}/usr/bin
  install -m=755 -t "${pkgdir}/usr/bin" clash-tun2socks clash-tun2socks-cleanup clash-redir clash-redir-cleanup
  install -Dm644  LICENSE "${pkgdir}/usr/share/licenses/clash-scripts/LICENSE"
  install -Dm644  config "${pkgdir}/etc/clash-scripts/env"
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -m=755 -t "${pkgdir}/usr/lib/systemd/system/" *.service
}
