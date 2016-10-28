# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc
pkgver=1.1.0
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
sha256sums=('995ba35a488a7d9e10d43a49ae05fbe909ad2e72fd84b4fa26911da53f0408f9')

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
        cp config.js.example $pkgdir/var/lib/teleirc/config.js

        mkdir -p $pkgdir/usr/lib/systemd/system/
        cp teleirc.service $pkgdir/usr/lib/systemd/system/
}
