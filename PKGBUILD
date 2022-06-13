# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Laszlo Papp <djszapi @ archlinux us>
# Contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail d com>

_name=gnupg
pkgname=vim-${_name}-git
pkgver=2.7.1.r3.gf9b608f
pkgrel=1
pkgdesc="Plugin for transparent editing of gpg encrypted files"
arch=('any')
url="https://github.com/jamessan/vim-gnupg"
license=('GPL2')
groups=('vim-plugins')
depends=('vim')
conflicts=('vim-gnupg')
makedepends=('git')
source=("${_name}::git+${url}.git")
sha256sums=( SKIP )

pkgver() {
    cd "${_name}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    install -Dm644 "${srcdir}/${_name}/plugin/${_name}.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/${_name}.vim"
}

# vim:set ts=2 sw=2 et:
