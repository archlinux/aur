# Maintainer: revsuine <paradoor at protonmail dot com>
pkgname=numlockw
pkgver=r14.e5a0e83
pkgrel=1
pkgdesc="A Wayland clone of numlockx"
arch=(any)
url="https://github.com/xz-dev/numlockw"
license=('GPL-3.0-or-later')
# not including python-evdev as pipx should handle that
depends=("python")
makedepends=("git"
             "python-pipx")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # number of revisions since beginning of history
    # https://wiki.archlinux.org/title/VCS_package_guidelines#The_pkgver()_function
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    # set up env vars to avoid permission errors
    export PIPX_GLOBAL_HOME="$pkgdir/opt/pipx"
    export PIPX_GLOBAL_BIN_DIR="$pkgdir/usr/bin"
    export PIPX_GLOBAL_MAN_DIR="$pkgdir/usr/share/man"

    pipx install --global "$srcdir/$pkgname"
}
