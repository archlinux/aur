# Maintaoner: Yamada Hayao <development@fascode.net>

_reponame="lightdm-qtquick-greeter"
pkgname="${_reponame}-git"
pkgver=r18.d1c29b1
pkgrel=1
pkgdesc="New Greeter for LightDM written in Qt"
arch=('x86_64' "i686")
url="https://github.com/FascodeNet/lightdm-qtquick-greeter"
license=('custom')
depends=("liblightdm-qt5")
makedepends=("git")
backup=("etc/lightdm/lightdm-qtquick-greeter.json")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/${_reponame}"
    cmake -GNinja
    ninja
}

package() {
    cd "${srcdir}/${_reponame}"
    install -m 755 -D "src/lightdm-qtquick-greeter" "${pkgdir}/usr/bin/lightdm-qtquick-greeter"
    install -m 755 -D "misc/lightdm-qtquick-greeter.desktop" "${pkgdir}/usr/share/xgreeters/lightdm-qtquick-greeter.desktop"
    install -m 755 -D "misc/lightdm-qtquick-greeter.json"  "${pkgdir}/etc/lightdm/lightdm-qtquick-greeter.json"
}
