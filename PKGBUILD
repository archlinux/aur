# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-bin
pkgver=0.7.9
pkgrel=2
pkgdesc="High-performance Document and Image viewer that prioritizes screen space and control"
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-imageformats'
    'libarchive'
)
optdepends=(
    'djvulibre: DjVu documents'
    'librsvg: more accurate rendering of SVG images'
    'libexif: EXIF metadata in the properties of images'
    'binutils: symbolized stack traces in crash reports'
    'xdg-utils: open links in the web browser'
    'qt6-wayland: native Wayland support'
    'kvantum: Kvantum theme engine'
    'lua-language-server: completion for init.lua, using the installed Lua stubs'
)
provides=("lektra=${pkgver}")
conflicts=('lektra' 'lektra-git')
# The release binary keeps its debug info (for symbolized crash reports);
# makepkg would strip it into a separate -debug package.
options=('!strip' '!debug')
source=(
    "lektra-${pkgver}-x86_64.tar.gz::https://codeberg.org/lektra/lektra/releases/download/v${pkgver}/lektra-${pkgver}-x86_64.tar.gz"
)

sha256sums=('8515b805f0e831ef407ac8be1503e83e1083acae6d3ec9454f090b4eb1fedeff')

package() {
    # The tarball is a ready-made /usr tree: binary, desktop file, man page,
    # tutorial, Lua stubs, translations, config schema and hicolor icons.
    cp -a "${srcdir}/usr" "${pkgdir}/"
}
