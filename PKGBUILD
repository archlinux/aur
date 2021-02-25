_pkgname=croco-assistant
pkgname=${_pkgname}-git
pkgver=r50.6d7c16b
pkgrel=1
pkgdesc="A assistant app for Croco OS"
arch=('any')
url="https://gitlab.com/croco-os/applications/croco-assistant"
license=('GPL3')
depends=('qt5-base' 'xdg-utils' 'polkit' 'alacritty' 'micro' 'reflector-simple' 'hblock' 'xorg-xdpyinfo' 'pace' 'pamac')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('croco-git')
source=("repo::git+https://gitlab.com/croco-os/applications/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/repo"
# Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/repo"
        qmake-qt5 ${_pkgname}.pro
        make
}

package() {
        cd "$srcdir/repo"
        make INSTALL_ROOT=${pkgdir} install
}
