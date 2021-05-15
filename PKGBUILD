# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=ride-git
pkgrel=1
pkgver=v4.4.3524
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
    '560181d7b26d3c58d053ee10904bc691a4c7d9ae7f8ae29f939463b61f6b1f6a'
)

pkgver() {
    cd ride
    git describe --tags
}

build() {
    cd ride
    npm i || true  # npm is weird
    node mk linux
}

package() {
    mkdir -p $pkgdir/usr/share/ride/
    mkdir -p $pkgdir/usr/bin/

    cp -a $srcdir/ride/_/ride44/Ride-4.4-linux-x64/* $pkgdir/usr/share/ride/

    install -m755 ride.sh $pkgdir/usr/bin/ride
}
