# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc-git
_pkgname=teleirc
pkgver=124
pkgrel=1
epoch=
pkgdesc="NodeJS Telegram to IRC bridge bot (direct from GitHub)"
arch=('any')
url="https://github.com/ritlug/teleirc"
license=('MIT')
groups=()
depends=("nodejs"
         "yarn"
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("var/lib/teleirc/config.js"
        "var/lib/teleirc/.env"
)
options=()
install="teleirc.install"
changelog=
source=("git+https://github.com/ritlug/teleirc.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
        cd $srcdir/${_pkgname}
        git rev-list --count HEAD
}

prepare() {
        cd $srcdir/${_pkgname}
}

build() {
        cd $srcdir/${_pkgname}
        yarn install
}

check() {
        echo "No check"
}

package() {
        mkdir -p $pkgdir/var/lib/teleirc

        cd $srcdir/${_pkgname}
        cp -r node_modules $pkgdir/var/lib/teleirc/
        cp teleirc.js $pkgdir/var/lib/teleirc/
        cp env.example $pkgdir/var/lib/teleirc/.env

        mkdir -p $pkgdir/usr/lib/systemd/system/
        cp misc/teleirc.service $pkgdir/usr/lib/systemd/system/
}
