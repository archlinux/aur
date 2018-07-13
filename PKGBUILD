# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=urutau-icons-git
_gitname=urutau-icons
pkgver=latest
pkgrel=1
pkgdesc="The most complete package of icons for third-party applications with elementary OS design"
arch=('i686' 'x86_64')
url="https://github.com/btd1337/${_gitname}"
license=('GPL3')
makedepends=('git')
options=('!strip')
conflicts=(${_gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
    gsettings set org.gnome.desktop.interface icon-theme "${_gitname}"
}

