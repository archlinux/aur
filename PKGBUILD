# Maintainer: europrimus <aur-g4gra@c-f.me>

_pkgname=terratactician-expandoria
pkgname=${_pkgname}-bin
_reponame=tte-linux-amd64
pkgver=0.4.2 # renovate: datasource=forgejo-releases registryUrl=https://codeberg.org depName=terratactician-expandoria/game
pkgrel=1
pkgdesc='Open-source strategy puzzle video game, inspired by games like Dorfromantik. Binary version'
url='https://terratactician-expandoria.codeberg.page'
license=('AGPL-3.0-or-later')
depends=('libx11' 'pkgconf' 'alsa-lib' 'libxcursor' 'libxrandr' 'libxi' 'vulkan-driver')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/terratactician-expandoria/game/releases/download/v${pkgver}/tte-linux-amd64-v${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('e2162ae53adc0ea968387a52d9ab829eebc47b78cbf409a9dfb29472754d620d'
            '06c0c95f10ec50eda229a951d91f7670a17f11590b8b0776100a82a43f5f341c')


package() {
	# copie game files
    mkdir -p "${pkgdir}/usr/share/"
	cp -r "${srcdir}/${_reponame}" "${pkgdir}/usr/share/${_pkgname}"
    # change group
    chgrp -R games "${pkgdir}/usr/share/${_pkgname}/"
	# install icon for menu entry
	install -Dm644 "${srcdir}/${_reponame}/assets/icons/app-icon.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	# install shortcut menu entry
	install -Dm644 "$srcdir/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # create shell shortcut
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
