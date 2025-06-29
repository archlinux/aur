# Maintainer: Scott Lill <dev at scottlill dot com>

pkgname='cosmic-ext-extra-sessions-niri-git'
pkgver=r3.66e0657
pkgrel=1
pkgdesc='Alternative session for running the COSMIC desktop with Niri as the compositor'
arch=('x86_64')
url='https://github.com/Drakulix/cosmic-ext-extra-sessions'
depends=('cosmic-session')
makedepends=('just')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd cosmic-ext-extra-sessions
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd cosmic-ext-extra-sessions
    git submodule update --init
    # Bugfix to make installing in pkgdir work
    sed -i 's/: _install/: (_install rootdir prefix)/g' justfile
}

build() {
    cd cosmic-ext-extra-sessions
    just build
}

package() {
    cd cosmic-ext-extra-sessions
    just install-niri $pkgdir
}
