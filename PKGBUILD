# Maintainer: snogard <snogardb at gmail dot com>

_guessedVersion=0.1.3
_guessedVersionCommit=1160232cefd6bad30071d3923cd3fea9ded54000

pkgname=linux-hunter-git
pkgver=0.1.3.r9.ga161fba
pkgrel=1
pkgdesc='Prototype Monster Hunter World companion app for Linux, inspired by SmartHunter'
arch=(x86_64)
url=https://github.com/Emanem/linux-hunter
license=(GPL3)
depends=(ncurses)
makedepends=(
    git
    ncurses
)
provides=('linux-hunter')
source=("linux-hunter::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    # The repository is not properly tagged so i refer to its readme to guess its correct version
    # see -> https://github.com/Emanem/linux-hunter/commit/1160232cefd6bad30071d3923cd3fea9ded54000
    if [ -z $(git tag -l) ]; then
        git tag $_guessedVersion $_guessedVersionCommit
    fi
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    make release -C linux-hunter
}

package(){
    install -Dm755 linux-hunter/linux-hunter ${pkgdir}/usr/bin/linux-hunter
}
