# Maintainer: Ryan Pepper <pypper@protonmail.com>
# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=ssb-patchwork
_upstream=patchwork
pkgver=3.11.2
pkgrel=1
pkgdesc="A decentralized messaging and sharing app built on top of Secure Scuttlebutt (SSB)"
arch=('i686' 'x86_64')
url="https://github.com/ssbc/patchwork"
license=('AGPL3')
depends=('libxtst' 'libxext' 'libxkbfile' 'gconf' 'libsodium' 'libxss' 'gtk2' 'alsa-lib' 'nss' 'electron')
makedepends=('nodejs' 'npm')
options=(!strip)
source=(
"https://github.com/ssbc/${_upstream}/archive/v${pkgver}.tar.gz"
'run.sh'
"${pkgname}.desktop"
)

sha512sums=(
'451236723cb7cc8e3ad83a0d90c7dae22944e381887d25673da6a1663b04bfe3a3bed843dd8e57d601d3c927de1bf6c50a3197585eb9bd3c2104cd3f0e28b227'
'0df1ea65d60742d82ef04bea84376380cad03d3cd4ffb326374578f9f9954ad326b19fc81162ae838c10ae45acdd236c37731b68ca535cbbe7ddf4b69266c33c'
'09292ec2f7c02d741cbeb046bd99293f4d144314d0233252dd34a619e1aacbbbf28078677c0871d367240e29aa50d9197bbe0a35e5b14f7ff9a6288c386124f6'
)


build() {
    cd "${srcdir}/${_upstream}-${pkgver}"
    npm ci --only=production
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
