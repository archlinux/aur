# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Dusan Saiko <dusan at saiko dot cz>

_pkgname='kreya'
_upkgname='Kreya'
pkgname="${_pkgname}-bin"
pkgver=1.15.0
pkgrel=1
pkgdesc='GUI client for gRPC and REST APIs'
arch=('x86_64')
url='https://kreya.app/'
_url_source='https://github.com/riok/Kreya'
license=('custom')
depends=('hicolor-icon-theme' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://stable-downloads.kreya.app/Kreya-linux-x64.tar.gz"
        "kreya_256x256.png"
        "kreya.desktop")
sha256sums=('41a608c1298a3988e94451ea0d0a870c998186ba0ecda461df18d83ed8555426'
            '15877fa13b3f0c379c4a70131daebdc199e83a1ad18d5daa1c93309815adcd7c'
            'SKIP')
options=("!strip")

package() {
    install -Dm0644 "kreya_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kreya.png"
    install -Dm0644 kreya.desktop -t "${pkgdir}"/usr/share/applications/

     # Move package contents to /opt/Kreya
    mkdir -p "${pkgdir}/opt/kreya" "${pkgdir}"/usr/bin/
    cp -r "${srcdir}/linux-x64/" "${pkgdir}/opt/kreya"

    # Symlink /usr/bin executable to opt
    ln -s /opt/kreya/linux-x64/kreya "${pkgdir}"/usr/bin/kreya
}
