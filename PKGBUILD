# Maintainer: Jenic Rycr <jenic at goos [dot] es>
# Contributor: Jeremy Cantrell <jmcantrell at gmail dot com>

pkgname=passage-git
pkgver=1.7.4a0.r526.4e4c5ae
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
    # Hard-coding the original password-store version used before passage fork
    # Passage itself doesn't use tags so we go off revision number alone
    # See: https://wiki.archlinux.org/title/VCS_package_guidelines
    printf "1.7.4a0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR=$pkgdir make install
}
