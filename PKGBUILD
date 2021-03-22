# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=efistubmgr-git
pkgver=1.0.0.r0.gb9c9e9b
pkgrel=1
pkgdesc="Script for managing Linux EFISTUB boot entries"
arch=('any')
url='https://github.com/openglfreak/efistubmgr'
makedepends=('git')
_depends=('bash' 'efibootmgr')
provides=("efistubmgr=$pkgver")
license=('MPL2')
source=('git+https://github.com/openglfreak/efistubmgr.git')
sha256sums=('SKIP')

pkgver() {(
    cd "$srcdir/efistubmgr"
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/^[a-z][a-z]*-//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
);}

package() {
    depends=("${_depends[@]}")
    install -Dm755 "$srcdir/efistubmgr/src/update-efi.sh" "$pkgdir/usr/bin/update-efi"
    install -Dm644 "$srcdir/efistubmgr/examples/archlinux-default-config.conf" "$pkgdir/etc/xdg/efistubmgr.conf"
}
