# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=ride-git
pkgrel=1
pkgver=v4.5.3692
pkgdesc='A remote IDE for Dyalog APL'
url='https://github.com/Dyalog/ride'
arch=('x86_64')
license=('MIT')
depends=(
    'nodejs'
    'dyalog-bin'
)
makedepends=(
    'npm'
    'git'
)
source=(
    'git+https://github.com/dyalog/ride'
    'ride.sh'
)
sha256sums=(
    'SKIP'
    '26953c40c0ff6434d0dbd932701811c7037f8e65e06b65065fc15780b2481bb9'
)

pkgver() {
    cd ride
    npm i &>/dev/null
    node mk
}

build() {
    cd ride
    npm i || true
    node mk linux
}

package() {
    mkdir -p $pkgdir/usr/share/ride/
    mkdir -p $pkgdir/usr/bin/

    cp -a $srcdir/ride/_/ride45/Ride-4.5-linux-x64/* $pkgdir/usr/share/ride/

    install -m755 ride.sh $pkgdir/usr/bin/ride
}
