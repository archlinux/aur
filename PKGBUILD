# Maintainer: netcrusher < tobias AT miglix DOT eu >

_basename=renderdoc
pkgname=${_basename}-bin
pkgver=0.34
_branch=v${pkgver}
_tarname=${_basename}_${pkgver}
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
        "https://raw.githubusercontent.com/baldurk/$_basename/$_branch/LICENSE.md")
sha256sums=('04d11028c53c0cd1d4f20bcbf68c51e183601fcf30a9f0e29bcd7cda0fea0f08'
            'SKIP'
            'e52150c6d24d3bd7d002c394f02947136bc2c7bf85caf2fe4636db0c0155a7aa')
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')

package() {
    cd $_tarname
    mkdir -p $pkgdir/usr/share/licenses/renderdoc-bin

    cp -rt $pkgdir/usr bin lib share

    cd $pkgdir/usr
    install -Dm644 $srcdir/LICENSE.md share/licenses/renderdoc-bin
    find share/ -type f -exec chmod 644 {} \;
    find lib/ bin/ -type f -exec chmod 755 {} \;
}
