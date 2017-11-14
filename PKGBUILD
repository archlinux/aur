# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>
# Contributor: Carlo Casta <carlo.casta@gmail.com>

pkgname=gli
pkgver=0.8.2.0
pkgrel=1
pkgdesc="OpenGL Image (GLI) is a header only C++ image library for graphics software"
arch=('any')
license=('MIT')
url="http://gli.g-truc.net"
provides=('glm=0.9.8.0')
conflicts=('glm')
source=("https://github.com/g-truc/gli/releases/download/${pkgver}/gli-${pkgver}.zip")
sha512sums=('192a555dac89add99d3e5e5e022bd112acfb8c1646ef1630c13c22658086077d5a73bbc0528b3666549867bb9eb114ea853f4aca0d5ae0e60e10d30b0ad0652e')

package() {
    cd $pkgname

    mkdir -p $pkgdir/usr/include/gli
    cp -r gli $pkgdir/usr/include
    rm -f $pkgdir/usr/include/gli/CMakeLists.txt

    # gli provides a custom / git version of GLM
    mkdir -p $pkgdir/usr/include/glm
    cp -r external/glm/glm $pkgdir/usr/include
    rm -f $pkgdir/usr/include/glm/CMakeLists.txt

    find $pkgdir -type f -exec chmod 644 {} \;
    find $pkgdir -type d -exec chmod 755 {} \;
}
