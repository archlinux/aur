pkgname=strm
_pkgname=strm-cli
pkgver=1
pkgrel=1
pkgdesc="A command-line interface for strumati"
arch=('x86_64' 'aarch64')
url="https://github.com/strumati/strm-cli"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'gcc')
provides=('strm-cli')
conflicts=('strm-cli')

source=("git+https://github.com/strumati/strm-cli.git")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"

    # use /usr/share
    sed -i 's|/opt/strm/strm.js|/usr/share/strm-cli/strm.js|' strm.c
}

build() {
    cd "$_pkgname"
    gcc strm.c -o strm
}

package() {
    cd "$_pkgname"

    install -Dm755 strm "$pkgdir/usr/bin/strm"

    install -dm755 "$pkgdir/usr/share/strm-cli"

    install -Dm644 strm.js \
        "$pkgdir/usr/share/strm-cli/strm.js"

    install -Dm644 default.js \
        "$pkgdir/usr/share/strm-cli/default.js"

    install -Dm644 headers.js \
        "$pkgdir/usr/share/strm-cli/headers.js"

    install -Dm644 config.json \
        "$pkgdir/usr/share/strm-cli/config.json"

    cp -r api "$pkgdir/usr/share/strm-cli/"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
