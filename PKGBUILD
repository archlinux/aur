# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=zellij-selector
pkgname=$_pkgname-git
pkgver=2.6.0.r1.g1f7f130
pkgrel=1
pkgdesc='Select zellij session'
arch=('any')
url='https://gitlab.com/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij' 'jq.sh' 'yq')
makedepends=('git' 'shellcheck' 'getoptions')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/stefanwimmer128/zellij-selector.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    ./bootstrap
}

build() {
    cd "$_pkgname"

    ./configure --prefix=/usr
    make
}

check() {
    cd "$_pkgname"

    make check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir" install
}
