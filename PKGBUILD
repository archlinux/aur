# Maintainer: Ryan Pepper <pypper@protonmail.com>
# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=ssb-patchwork
_upstream=patchwork
pkgver=3.8.6
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB)"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'gconf' 'libsodium' 'libxss' 'gtk2' 'nodejs' 'npm' 'alsa-lib' 'nss')
options=(!strip)
source=(
"https://github.com/ssbc/${_upstream}/archive/v${pkgver}.tar.gz"
'run.sh'
"${pkgname}.desktop"
)
md5sums=('6889ff0b42d44c115552821338826261'
         '26bbb4043ff690355e9d83f539484644'
         '2b507044b1ae8f5d00aea5b148ec65f0')

build() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    npm install
}

package() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a * "${pkgdir}/opt/${pkgname}"
    install -D assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    cd "${srcdir}"
    install -D run.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
}
