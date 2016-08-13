# Maintainer: orumin <dev@orum.in>

pkgname=wacom-utility-git
pkgver=r20.d9735e0
pkgrel=1
pkgdesc="Graphical tablet configuration utility"
arch=('i686' 'x86_64')
url="http://github.com/lubosz/wacom-utility.git"
license=('GPL')
depends=('gtk2' 'python2' 'xf86-input-wacom' 'gksu')
conflicts=('wacom-utility')
replaces=('wacom-utility')
source=("${pkgname}::git+${url}"
        'wacom-utility.desktop')
md5sums=('SKIP'
         '1d44b3571fd5e48b80b2dec5209fcf47')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"

    mkdir -p "${pkgdir}"/usr/share/wacom-utility
    mkdir -p "${pkgdir}"/usr/share/applications
    cp -a ./* "${pkgdir}"/usr/share/wacom-utility
    install -Dm644 "${startdir}"/wacom-utility.desktop "${pkgdir}"/usr/share/applications/
}
