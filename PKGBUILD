# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-git
pkgver=0.8.0.r0.bc903aa
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
depends=('gtk3' 'cairo' 'libxcb' 'pango' 'qt5-base')
makedepends=('cargo' 'cmake')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    local tag=$(git tag --sort=v:refname | grep '^v[0-9]' | tail -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$(echo $tag | cut -b2-).r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

build() {
    cd "${pkgname}"
    cargo build --release
    pkg/release.sh
}

package() {
    cd "${pkgname}"
    PREFIX="${pkgdir}" pkg/install.sh
}

