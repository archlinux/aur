# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc
pkgver=1.2.2
pkgrel=1
epoch=
pkgdesc="NodeJS Telegram to IRC bridge bot"
arch=('any')
url="https://github.com/ritlug/teleirc"
license=('MIT')
groups=()
depends=("nodejs"
         "npm"
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("var/lib/teleirc/config.js")
options=()
install="teleirc.install"
changelog=
source=("https://github.com/ritlug/teleirc/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('9ef394510beab9836ef50cdcdfa4f3e75fe763fe9f7abc7bd51027a5cbc1b66d')

prepare() {
        cd $srcdir/$pkgname-$pkgver
}

build() {
        cd $srcdir/$pkgname-$pkgver
        npm install
}

check() {
        echo "No check"
}

package() {
        mkdir -p $pkgdir/var/lib/teleirc

        cd $srcdir/$pkgname-$pkgver
        cp -r node_modules $pkgdir/var/lib/teleirc/
        cp teleirc.js $pkgdir/var/lib/teleirc/
        cp env.example $pkgdir/var/lib/teleirc/.env

        mkdir -p $pkgdir/usr/lib/systemd/system/
        cp misc/teleirc.service $pkgdir/usr/lib/systemd/system/
}
