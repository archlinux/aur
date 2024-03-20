pkgname=hyprdots-ctl-git
pkgver=v0.4.2.r0.gf8d5b10
pkgrel=1
pkgdesc="CLI for Hyprdots Configurations ++ Hidden Gems"
arch=('x86_64')
url="https://github.com/kRHYME7/Hyprdots-ctl"
license=('GPL3')
depends=( 'fzf' 'tree' 'ttf-jetbrains-mono-nerd' )
makedepends=('git' 'make' 'curl' 'base-devel')
conflicts=("hyprdots-ctl")
source=("git+https://github.com/kRHYME7/Hyprdots-ctl.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/Hyprdots-ctl" || return
    git fetch --tags 
    latest_tag=$(git tag --sort=-v:refname | head -n 1)
    local version=$(git describe --tags --long --always $latest_tag  | sed 's/\([^-]*-g[0-9a-f]*\)/r\1/;s/[-+]/./g')
    echo "${version}"
}

package() {
    cd "${srcdir}/Hyprdots-ctl" || return
    make DESTDIR="$pkgdir" clean all
}
