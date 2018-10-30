# Maintainer: Ryan Pepper <pypper@protonmail.com>
# Maintainer: Daniel Landau <daniel@landau.fi>

pkgname=ssb-patchwork
_upstream=patchwork
pkgver=3.11.3
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
'09b9bb41e6b8fdd987051727225c9d24acae03f4e284b5495e7f3d85c69011d13f892f253bf8dad05f8c35edbcba3ae809931f74a5cf4d540d7b5604026d27bd'
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
