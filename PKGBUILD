# Maintainer: Thomas Lübking <thomas.luebking at gmail>

pkgname=qiq-git
_gitname=qiq
pkgver=r118.5e7e745
pkgrel=1
pkgdesc="GUI shell, app runner, command input (and output), status widgets, notes, notifcations"
arch=(i686 x86_64)
url="https://github.com/luebking/qiq"
license=(GPL)
depends=(qt6-base layer-shell-qt)
makedepends=(git)
optdepends=('aha: Output colors'
            'ansifilter: (suggested) Output colors'
            'bc: Calculator'
            'libqalculate: (suggested) Calculator'
            'zsh: To use its autocompletion')
provides=(qiq)
conflicts=(qiq)
source=("git+https://github.com/luebking/qiq.git")
sha256sums=("SKIP")
options=(docs)

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_gitname}"
    qmake6
    make
}

package() {
    cd "${_gitname}"
    make INSTALL_ROOT="${pkgdir}" install
}
