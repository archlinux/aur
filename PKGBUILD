# $Id: PKGBUILD 125609 2015-01-08 16:40:44Z bgyorgy $
# Maintainer: Chris Trotman <chris@trotman.io>

pkgname=battery-status-git
pkgver=r37.ac63efe
pkgrel=1
pkgdesc="a tool to keep track of your battery statistics"
arch=('any')
license=('GPL2')
url="https://github.com/petterreinholdtsen/battery-status"
provides=('battery-status')
conflicts=('battery-status')
depends=('bash')
optdepends=('gnuplot: graphing support')
makedepends=()
source=(
    'git://github.com/petterreinholdtsen/battery-status'
    'battery-status-collect-suspend.service'
    'battery-status-collect.service'
    'battery-status-collect.timer'
)
md5sums=('SKIP' 'a4bb68232488ea27998a9e293e5e968f' '4d545f24a5b932990800dfa2883643c9' 'a603c74f85952bfa8a89f76599dd340a')
install=battery-status-git.install

pkgver() {
    cd battery-status
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd battery-status

    install -Dm755 battery-status-collect "$pkgdir/usr/bin/battery-status-collect"
    install -Dm755 battery-status-graph "$pkgdir/usr/bin/battery-status-graph"
    install -Dm644 $srcdir/battery-status-collect-suspend.service "$pkgdir/usr/lib/systemd/system/battery-status-collect-suspend.service"
    install -Dm644 $srcdir/battery-status-collect.service "$pkgdir/usr/lib/systemd/system/battery-status-collect.service"
    install -Dm644 $srcdir/battery-status-collect.timer "$pkgdir/usr/lib/systemd/system/battery-status-collect.timer"
}
