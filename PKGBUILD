# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: 9M2PJU <9m2pju@gmail.com>

pkgname=zuno-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Desktop YouTube Music client built with Tauri (prebuilt binary from upstream releases)"
arch=('x86_64')
url="https://github.com/noFAYZ/zuno"
license=('Apache-2.0')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'libayatana-appindicator'
  'glib2'
  'cairo'
  'pango'
  'gdk-pixbuf2'
  'fontconfig'
  'freetype2'
  'hicolor-icon-theme'
  'desktop-file-utils'
)
provides=('zuno')
conflicts=('zuno' 'zuno-git')
options=('!strip' '!emptydirs')
source_x86_64=("Zuno_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/Zuno_${pkgver}_amd64.deb")
sha256sums_x86_64=('3abc57c1accaaf3ef68a0aa37d3b9e6e81ad9ae1a5a8216a739efeb8578c05da')
noextract=("Zuno_${pkgver}_amd64.deb")

package() {
    cd "${srcdir}"

    local deb="Zuno_${pkgver}_amd64.deb"
    ar x "${deb}"

    tar -xzf data.tar.gz -C "${pkgdir}"

    # Fix permissions
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Desktop file lives under usr/share/applications/Zuno.desktop; rename to lowercase for consistency
    if [[ -f "${pkgdir}/usr/share/applications/Zuno.desktop" ]]; then
        mv "${pkgdir}/usr/share/applications/Zuno.desktop" \
           "${pkgdir}/usr/share/applications/zuno.desktop"
    fi
}
