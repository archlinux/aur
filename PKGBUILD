# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=efistubmgr-git
pkgver=1.0.2
pkgrel=1
pkgdesc="Script for managing Linux EFISTUB boot entries"
arch=('any')
url='https://github.com/openglfreak/efistubmgr'
makedepends=('git')
_depends=('sh' 'efibootmgr')
provides=("efistubmgr=$pkgver")
license=('MPL2')
backup=('etc/xdg/efistubmgr.conf')
source=('git+https://github.com/openglfreak/efistubmgr.git')
sha256sums=('SKIP')

pkgver() {(
    cd "$srcdir/efistubmgr"
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/^[a-z][a-z]*-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.r0\.g.*$//' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
);}

package() {
    depends=("${_depends[@]}")
    install -Dm755 "$srcdir/efistubmgr/src/update-efi.sh" "$pkgdir/usr/bin/update-efi"
    install -Dm644 "$srcdir/efistubmgr/examples/archlinux-default-config.conf" "$pkgdir/etc/xdg/efistubmgr.conf"
}
