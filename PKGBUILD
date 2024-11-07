# Maintainer: Tristan Brugère < tristan at bruge dot re >
_pkgname=yabd
pkgname="$_pkgname-git"
pkgver=0.2.2.31.a6af8c0
pkgrel=1
pkgdesc="Yet Another Brightness Daemon — set screen brightness from ambient light sensor"
arch=("any")
url="https://github.com/tbrugere/yabd"
license=("custom:CeCILL-B")

depends=(
    "python>=3.10" 
    "iio-sensor-proxy"
    "python-sdbus"
)

makedepends=(
    "python-poetry"
    "git"
)

source=(
    "git+https://github.com/tbrugere/yabd.git"
)

sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)"
  RELEASE=$(poetry version -s)
  echo "$RELEASE.$REVISION"
}

package() {
    cd "$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" #license
    install -D yabd.py "$pkgdir/usr/bin/yabd"
    install -Dm644 etc/yabd.service "$pkgdir/usr/lib/systemd/user/yabd.service"
}
