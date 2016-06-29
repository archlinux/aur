# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>
# Contributor: Carlo Casta <carlo.casta@gmail.com>

pkgname=gli
pkgver=0.8.1.0
pkgrel=1
pkgdesc="OpenGL Image (GLI) is a header only C++ image library for graphics software"
arch=('any')
license=('MIT')
url="http://gli.g-truc.net"
provides=('glm=0.9.8.0')
conflicts=('glm')
source=("https://github.com/g-truc/gli/releases/download/${pkgver}/gli-${pkgver}.zip")
sha512sums=('a3a0219903ebd445e377469047d482e5033441c0f610fc0f39b527ef20327892f9817b026a77c22198fec9ed1841d923c274e2b3fe0ed219309846348747c186')

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