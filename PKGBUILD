#-*- mode: sh; -*-

# Maintainer: Bart Libert <bart dot libert at gmail dot com>
pkgname=onhub_desktop_client-git
pkgver=5fd6fdc
pkgrel=2
pkgdesc='A desktop client for Google Onhub routers'
arch=('x86_64')
url='https://github.com/AngeloD2022/OnHubDesktop'
license=('GPL3')
depends=('qt5-webengine' 'qt5-charts')
makedepends=('git')
provides=("OnHubDesktopClient")
source=("$pkgname::git+https://github.com/AngeloD2022/OnHubDesktop.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    qmake OnHubDesktopClient.pro
    make
}

package() {
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$srcdir/$pkgname/OnHubDesktopClient" "$pkgdir/usr/bin/OnHubDesktopClient"
}

