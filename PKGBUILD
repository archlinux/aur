# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=urutau-icons
pkgname=("${gitname}-git")
pkgver=latest
pkgrel=1
pkgdesc="The most complete package of icons for third-party applications with elementary OS design. Make a small donation to maintain this project. Donation link: http://bit.do/urutau-icons-donate"
arch=('i686' 'x86_64')
url="https://github.com/btd1337/${gitname}"
license=('GPL3')
depends=('elementary-icon-theme')
makedepends=('git')
options=('!strip')
provides=("${gitname}")
conflicts=(${gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    rm -rf "$pkgdir/usr/share/icons/${gitname}/.gitignore"
    rm -rf "$pkgdir/usr/share/icons/${gitname}/.git"
}

