# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx[at]gmail[dot]com>

pkgname=adom-noteye
pkgver=3.0.6
pkgrel=1
pkgdesc="A roguelike game with a quest-centric, plot driven structure (+ GUI) - Please consider buying the game on Steam"
arch=("x86_64")
url="http://www.adom.de/"
conflicts=('adom' 'adom-restricted' 'adom-noteye')
provides=('adom')
depends=('ncurses' 'mesa' 'sdl_image' 'sdl_net' 'sdl_mixer' 'lua51' 'libbsd')
_repo_url="https://repo.sshadm.in/archlinux/eldios"

license=('custom:adom')
source_x86_64=(
    "${_repo_url}/${arch}/adom_noteye_64_${pkgver}.tar.gz"
    "${_repo_url}/common/adom.sh"
    "${_repo_url}/common/LICENSE"
    )

# PACKAGES
sha256sums_x86_64=(
    '5a81afa2409af2dde461dcce89f74c89b7807504b75bd5b3796c6187768fa050'
    'ffd19a5088bc63dffe386b4052f29b2194ab50c5b01ca1f574cfc51225a8afa8'
    'd0b08609c52ab96fb1083b2b0eea3d022549c59c87b793a140f5dfa56099544b'
    )

package() {
    # Copy entire contents of the archive to /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/adom" "${pkgdir}/opt/"

    # Since the adom binary uses a relative RPATH, it's either
    # this or patching the binary
    install "${srcdir}/adom.sh" "${pkgdir}/opt/adom/adom.sh"
    chmod 755 "${pkgdir}/opt/adom/adom.sh"

    install -d "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/opt/adom/adom.sh" "${pkgdir}/usr/bin/adom"

    # Add the LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    chmod 644 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
