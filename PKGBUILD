# Maintainer: riey <creeper844@gmail.com>
pkgname=kime-git
pkgver=0.9.0.r2.0a41639
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/Riey/kime"
conflicts=('kime')
provides=('kime')
makedepends=('cargo' 'cmake' 'ninja' 'cairo' 'libxcb' 'pango' 'gtk2' 'gtk3' 'gtk4' 'qt5-base' 'qt6-base')
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
    cargo xtask build --mode Release XIM WAYLAND GTK2 GTK3 GTK4 QT5 QT6
}

package() {
    cd "${pkgname}"
    cargo xtask install "${pkgdir}"
}

