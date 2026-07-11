# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=zellij-selector
pkgname=$_pkgname-git
pkgver=3.0.0.r1.gb52aa24
pkgrel=1
pkgdesc='Select zellij session'
arch=('any')
url='https://gitlab.com/stefanwimmer128/zellij-selector'
license=('MPL2')
depends=('sh' 'libnewt' 'zellij' 'jq.sh' 'yq')
makedepends=('git' 'shellcheck' 'getoptions-ng')
optdepends=('fish: Option to open fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname" || return
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname" || return
    ./bootstrap
    ./configure --prefix=/usr
}

build() {
    cd "$_pkgname" || return
    make
}

check() {
    cd "$_pkgname" || return
    make check
}

package() {
    cd "$_pkgname" || return
    make DESTDIR="$pkgdir" install
}
