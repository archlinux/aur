# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper' 'hyper-appimage')
provides=('hyper')
# from the DEB: Depends: gconf2, gconf-service, libnotify4, libappindicator1, libxtst6, libnss3, libxss1
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
options=('!strip' '!upx')

source_x86_64=(
    "https://github.com/zeit/hyper/releases/download/${pkgver}/hyper_${pkgver}_amd64.deb"
)

md5sums_x86_64=(
    'c2f69568ac4cc624f621f73dde8f1354'
)

package() {
    # extract the data file (already has everything as we need it)
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/Hyper/resources/bin/hyper" "${pkgdir}/usr/bin/hyper"
}
