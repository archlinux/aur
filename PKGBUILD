# Maintainer: Jenic Rycr <jenic at goos [dot] es>
# Contributor: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=passage-git
pkgver=1.7.4a0.r5.1262d30
pkgrel=1
pkgdesc="A fork of password-store that uses age as backend."
arch=('any')
url="https://github.com/FiloSottile/${pkgname%-git}"
license=('GPL')
depends=('bash' 'age' 'tree')
makedepends=('git')
checkdepends=()
optdepends=(
    'age-plugin-yubikey: for Yubikey support'
    'qrencode: for QR code support'
    'xclip: for clipboard support on X11'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR=$pkgdir make install
}
