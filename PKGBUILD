# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc-git
_pkgname=teleirc
pkgver=153
pkgrel=1
epoch=
pkgdesc="NodeJS Telegram to IRC bridge bot (direct from GitHub)"
arch=('any')
url="https://github.com/ritlug/teleirc"
license=('MIT')
groups=()
depends=("nodejs")
makedepends=("yarn")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("usr/lib/teleirc/config.js"
        "usr/lib/teleirc/.env"
)
options=()
install="teleirc.install"
changelog=
source=("git+https://github.com/ritlug/teleirc.git"
        "teleirc.sysusers"
)
noextract=()
sha256sums=('SKIP'
            '91507d509d079f0c0b2bb4bd121b40b18daabdfdc80494ae29f4bfcca86279e0'
)

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
        mkdir -p $pkgdir/usr/lib/teleirc

        cd $srcdir/${_pkgname}
        cp -r node_modules $pkgdir/usr/lib/teleirc/
        cp *.js $pkgdir/usr/lib/teleirc/
        cp env.example $pkgdir/usr/lib/teleirc/.env

        cp -r lib $pkgdir/usr/lib/teleirc/
        mkdir -p $pkgdir/usr/lib/systemd/system/
        cp misc/teleirc.service $pkgdir/usr/lib/systemd/system/

        install -D -m 644 "${srcdir}/teleirc.sysusers" "${pkgdir}/usr/lib/sysusers.d/teleirc.conf"

}
