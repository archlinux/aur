# Maintainer: fereira <eli@fereira.net>
# Contributor: knedl1k
# Contributor: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='4.11.2'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface (binary release)'
arch=('x86_64')

url='https://cinny.in/'
license=('AGPL-3.0')

# https://tauri.studio/v1/guides/getting-started/prerequisites#1-system-dependencies
depends=(
    'webkit2gtk'
    'openssl'
    'gtk3'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'libvips'
    'sqlite'
    'gst-plugins-good'
    'libsecret'
)
conflicts=('cinny-desktop')
provides=('cinny-desktop')

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/Cinny_desktop-x86_64.deb")
sha256sums_x86_64=('71f405ac1b7a30709feeda3b90fa611849a1a8c29f13a39b9efdc973124cc394')

install="${pkgname}.install"

package() {
    tar -xzf 'data.tar.gz' -C "${pkgdir}"
    # fix some wayland related issues (https://github.com/cinnyapp/cinny-desktop/issues/458) (stolen from system-tray pkg)
    sed -i 's/Exec=cinny/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 cinny/' "${pkgdir}/usr/share/applications/Cinny.desktop"
}
