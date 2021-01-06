# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=chromium-snowflake-git
pkgver=0.5.2.r0.g9565268
pkgrel=1
pkgdesc="Chromium extension for a WebRTC pluggable transport for Tor"
arch=('any')
url=https://snowflake.torproject.org/
license=('BSD')
makedepends=('git' 'npm')
source=("$pkgname::git+https://git.torproject.org/pluggable-transports/snowflake-webext.git")
sha256sums=('SKIP')

pkgver()
{
    cd $pkgname
    git describe --tags --long | sed 's/webext-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd "$srcdir"/$pkgname
    npm install
}

build()
{
    cd "$srcdir"/$pkgname
    npm run webext
}

check()
{
    cd "$srcdir"/$pkgname
    npm test
}

package()
{
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -dr --no-preserve=ownership "$srcdir"/$pkgname/webext/* "$pkgdir/usr/share/$pkgname/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

