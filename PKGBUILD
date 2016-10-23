# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc
pkgver=1.0.0
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
install=".install"
changelog=
source=("https://github.com/ritlug/teleirc/archive/v$pkgver.tar.gz"
        "https://gist.githubusercontent.com/thenaterhood/82d263945ff2f5248c73df63efd9f299/raw/64e867e702703bcd3e3cffb139544d5a4d25ae8b/teleirc.service"
)
noextract=()
sha256sums=('f152b76a7108244be8202ea1aea2fcb0b93341205accaed59e877bee2bae2306'
            'c79b238f7ad8128318fa8981e992d426ec7554f3f910513d454b5f05d211fd6d')

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
        cp $srcdir/teleirc.service $pkgdir/usr/lib/systemd/system/
}
