_pkgname=croco-welcome
pkgname=${_pkgname}-git
pkgver=r81.785bb36
pkgrel=1
pkgdesc="A Welcome app for Croco OS"
arch=('any')
url="https://gitlab.com/croco-os/applications/croco-welcome"
license=('GPL3')
depends=('qt5-base' 'xdg-utils')
optdepends=( 'xorg-xrandr' 'xorg-xinput' 'croco-assistant' 'croco-network-assistant' 'qwikaccess' 'croco-gamer' 'croco-boot-options')
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
