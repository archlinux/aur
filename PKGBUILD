# Maintainer: antsa <asss1924@gmail.com>

pkgname=mn32-git
pkgdesc='Configuration tool for Mionix Naos 3200'
url='https://gitlab.com/ant-sa/mn32'
pkgver=r9.de6e250
pkgrel=1
arch=('x86_64')
license=('Unlicense')
depends=('libusb' 'qt5-base')
makedepends=('git' 'qt5-base' 'gcc')

source=('MN32.desktop' '99-mn32.rules' 'mn32-git::git+https://gitlab.com/ant-sa/mn32.git')

sha512sums=( '2d7e974385d3098853b9dfd07e006c65d491a9e96f44cffcf809fb17debfc0a03ac51ebc5de7103e4fbca01444001f27198da5a172be373bbbd9bf81b6ffc38a'
             '3d6e5011ef1367bfed99a54f85d9939935996477a3a009c9cd307c51d54e063e079de52b2eee3575d85c93295274c89cdb96544782b68ca289c7ec5b251708b8'
             'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"/mn32
    qmake mn32.pro
    make
}

package() {
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/lib/udev/rules.d

    install -m644 "${srcdir}/MN32.desktop" "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/99-mn32.rules" "${pkgdir}/usr/lib/udev/rules.d"

    cd "$pkgname"/mn32
    make INSTALL_ROOT="$pkgdir/" install

}
