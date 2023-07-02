# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: Dusan Saiko <dusan at saiko dot cz>

_pkgname='kreya'
_upkgname='Kreya'
pkgname="${_pkgname}-bin"
pkgver=1.10.1
pkgrel=2
pkgdesc='GUI client for gRPC and REST APIs'
arch=('x86_64')
url='https://kreya.app/'
_url_source='https://github.com/riok/Kreya'
license=('custom')
depends=('hicolor-icon-theme' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://stable-downloads.kreya.app/Kreya-linux.tar.gz"
        "kreya_256x256.png"
        "kreya.desktop")
sha256sums=('7509451d5eafd61b2d237b1d8f22673b797cce9dce953788f4122365d70fc66e'
            '15877fa13b3f0c379c4a70131daebdc199e83a1ad18d5daa1c93309815adcd7c'
            '684bb2f9e3883a0c5ba36fbfbef18fc1330b54a0828833a435ed74356312f181')
options=()

package() {
    install -Dm0644 "kreya_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kreya.png"
    install -Dm0644 kreya.desktop -t "${pkgdir}"/usr/share/applications/

     # Move package contents to /opt/Kreya
    install -dm0755 "${pkgdir}"/opt/Kreya
    install -Dm0755 kreya "${pkgdir}/opt/Kreya/kreya"
    install -Dm0644 *.so "${pkgdir}/opt/Kreya/"

    # Symlink /usr/bin executable to opt
    install -dm0755 "${pkgdir}"/usr/bin
    ln -s /opt/Kreya/kreya "${pkgdir}"/usr/bin/kreya
}
