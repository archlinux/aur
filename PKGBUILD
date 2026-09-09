# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-mesh-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Claude Code and Codex local Tauri proxy gateway with Anthropic/OpenAI protocol translation, model mapping, and endpoint rotation/failover"
arch=('x86_64')
url="https://github.com/VkRainB/ccMesh"
license=('Apache-2.0')
options=('!debug')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libayatana-appindicator'
    'libgcc'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('cc-mesh')
conflicts=('cc-mesh')
_deb="ccMesh_${pkgver}_amd64.deb"
source_x86_64=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums_x86_64=('35883bf088a3dca36dbe0dbf1fb8e3e589df7575c0056ebcd1d5a166aed2389a')

package() {
    local data_member
    data_member=$(ar t "${srcdir}/${_deb}" | sed -n '/^data\.tar\.\(gz\|xz\|zst\|bz2\|lzma\)$/ { p; q; }')
    [[ -n "$data_member" ]] || {
        echo "Unable to find a supported data archive in ${_deb}" >&2
        return 1
    }

    ar p "${srcdir}/${_deb}" "$data_member" |
        bsdtar --no-same-owner -xf - -C "$pkgdir"
}
