# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=gli
pkgname=gli-git
pkgver=0.8.2.0.r70.g559cbe1e
pkgrel=1
pkgdesc="OpenGL Image (GLI) is a header only C++ image library for graphics software"
arch=('any')
license=('MIT')
url="http://gli.g-truc.net"
makedepends=('git' 'cmake')
conflicts=('gli')
provides=('gli')
depends=('glm>=0.9.7.0')
source=('git+https://github.com/g-truc/gli.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
#     git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
#     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    mkdir -p "$pkgdir"/usr/include/gli
    cp -r gli "$pkgdir"/usr/include
    rm -f "$pkgdir"/usr/include/gli/CMakeLists.txt
    find "$pkgdir" -type f -exec chmod 644 {} \;
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
