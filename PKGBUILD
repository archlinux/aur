# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-mesh-bin
pkgver=0.2.6
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
sha256sums_x86_64=('bfd00b24787dffb8614adeee1793c6abd159568bb0b8868c765f77fa433a9f4e')

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
