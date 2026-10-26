# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-mesh-bin
pkgver=0.2.11
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
sha256sums_x86_64=('1fe6d9d54b29465182255747ae2178ccea38c5418e873d29863028d748028b3e')

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
