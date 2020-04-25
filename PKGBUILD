# Maintainer: Nate Levesque <public@thenaterhood.com>
pkgname=teleirc-git
_pkgname=teleirc
pkgver=182
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
install=
changelog=
source=("git+https://github.com/ritlug/teleirc.git"
        "teleirc.sysusers"
)
noextract=()
sha256sums=('SKIP'
            '8aef33679b7c407fa38bb59b8973bad96ff193c42efa31702c7385722be334ef'
)

pkgver() {
        cd $srcdir/${_pkgname}
        git rev-list --count HEAD
}

prepare() {
        cd $srcdir/${_pkgname}
        git checkout -f v1.3.4
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
