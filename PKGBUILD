# Maintainer: netcrusher < tobias AT miglix DOT eu >

_basename=renderdoc
pkgname=${_basename}-bin
pkgver=0.33
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
sha256sums=('dde8c1ee496568d46b89f0aec081eef8d46da23ee80237fc096b694307ac50cf'
            'SKIP'
            'f144ffb364c8504757a8a78e25929f89d840ba7ed23b410492df42d5db604d5d')
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
