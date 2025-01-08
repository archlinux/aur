# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: flacs <0f1ac5@gmail.com>

_basename=renderdoc
pkgname=${_basename}-bin
pkgver=1.36
_tarname=${_basename}_${pkgver}
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool - binary version"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=('MIT')
conflicts=('renderdoc')
depends=("libgl" "libxcb" "libx11" "fontconfig" "freetype2" "glu" "libproxy" "python" "desktop-file-utils" "hicolor-icon-theme")
source=("https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz"
        "https://renderdoc.org/stable/$pkgver/$_tarname.tar.gz.sig"
        "amdspv.sh")
sha256sums=('b2a06c4f1bb48c9ff3c0f34a5738827ec850e56e1e38768630cb345c36953a82'
            'SKIP'
            '87bf87a4e93f83c6abeda90ee0bb9c76a844dd5a0ebae84f12d6fb59d988fa61')
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')

prepare() {
    cd $_tarname
    # patch library prefix
    sed -i 's|/io/dist|/usr|' etc/vulkan/implicit_layer.d/renderdoc_capture.json
}

package() {
    install -Dm755 amdspv.sh $pkgdir/usr/share/renderdoc/plugins/amd/isa/amdspv.sh
    cd $_tarname
    install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/renderdoc-bin/LICENSE.md
    cp -rt $pkgdir etc
    cp -rt $pkgdir/usr bin include lib share
}
