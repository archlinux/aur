# Maintainer: Dusan Saiko <dusan at saiko dot cz>

_pkgname='kreya'
_upkgname='Kreya'
pkgname="${_pkgname}-bin"
pkgver=1.8.1
pkgrel=1
pkgdesc='GUI client for gRPC and REST APIs'
arch=('x86_64')
url='https://kreya.app/'
_url_source='https://github.com/riok/Kreya'
license=('custom')
depends=('hicolor-icon-theme' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://stable-downloads.kreya.app/Kreya-linux.tar.gz" "kreya_256x256.png" "kreya.desktop")
sha256sums=('d38011f9a17d936ca6918ebfc4e7c4d548ff1d0a8729110470cc881551961d03'
            '15877fa13b3f0c379c4a70131daebdc199e83a1ad18d5daa1c93309815adcd7c'
            '5141abcc0daa80d56bc1363e1f4cc0ad41e2217d310dc281ce6fa1e7026f008a')

package() {
    install -Dm0644 "kreya_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kreya.png"
    install -Dm0644 kreya.desktop -t "${pkgdir}"/usr/share/applications/

     # Move package contents to /opt/Kreya
    cd "${srcdir}"
    install -dm0755 "${pkgdir}"/opt/Kreya
    install -Dm0755 kreya "${pkgdir}/opt/Kreya/kreya"
    install -Dm0644 *.so "${pkgdir}/opt/Kreya/"

    # Symlink /usr/bin executable to opt
    install -dm0755 "${pkgdir}"/usr/bin
    ln -s /opt/Kreya/kreya "${pkgdir}"/usr/bin/kreya
}

# vim: ts=2 sw=2 et:
