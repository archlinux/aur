# Maintainer: Ryan Pepper <pypper@protonmail.com>
# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=ssb-patchwork
_upstream=patchwork
pkgver=3.11.0
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
'64b0b0b613955bb0ac74958fc1f4878af8c30b801eecb75f3e1e5cd3ab6c42b66524cfc911ca53747629f33a53c630766b51543daf6368f97789676dc76f6903'
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
