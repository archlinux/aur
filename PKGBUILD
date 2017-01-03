# Maintainer: netcrusher < tobias AT miglix DOT eu >

_basename=renderdoc
pkgname=$_basename-bin
pkgver=0.32
_tarname=$_basename\_$pkgver
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool - binary version"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=('MIT')
conflicts=('renderdoc')
makedepends=()
depends=("mesa" "fontconfig" "hicolor-icon-theme")
source=("https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz"
        "https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz.sig"
        "https://raw.githubusercontent.com/baldurk/$_basename/master/LICENSE.md")
sha256sums=('8a40c2feb39281da44280df3e85d75f3d8c3b5787d8060c866624e2cf21e4f97'
            'SKIP'
            'f144ffb364c8504757a8a78e25929f89d840ba7ed23b410492df42d5db604d5d')
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')

package() {
    cd $_tarname
    mkdir -p $pkgdir/usr/share/licenses/renderdoc-bin

    cp -rt $pkgdir/usr bin lib share

    cd $pkgdir/usr
    install -Dm644 $srcdir/LICENSE.md share/licenses/renderdoc-bin
    find lib/ share/  -type f -exec chmod 644 {} \;
    find bin/ -type f -exec chmod 755 {} \;
}
