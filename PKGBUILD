# Maintainer: netcrusher < tobias AT miglix DOT eu >

_basename=renderdoc
pkgname=${_basename}-bin
pkgver=1.0
_branch=v${pkgver}
_tarname=${_basename}_${pkgver}
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool - binary version"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=('MIT')
conflicts=('renderdoc')
makedepends=()
depends=("mesa" "qt5-base" "qt5-svg" "qt5-x11extras" "python")
source=("https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz"
        "https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz.sig"
        "https://raw.githubusercontent.com/baldurk/$_basename/$_branch/LICENSE.md")
sha256sums=('591c4f1c897b521056824f04ddc44f6eab7fc9d985cda802966d1cb7c84a78fd'
            'SKIP'
            '6026dd733f5afcd01c3cb00d61b09979d014302540e9352172af39d303855c1a')
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
