# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=1.4.8
pkgrel=3
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper' 'hyper-appimage')
provides=('hyper')
# from the DEB: Depends: gconf2, gconf-service, libnotify4, libappindicator1, libxtst6, libnss3, libxss1
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
options=('!strip' '!upx')

_pkgver_correct=${pkgver/\.canary/-canary}

source_x86_64=(
    "https://github.com/zeit/hyper/releases/download/${_pkgver_correct}/hyper_${_pkgver_correct}_amd64.deb"
)

md5sums_x86_64=(
    '19d48f66a414cfcd233b4d78dee6f1e6'
)

package() {
    # extract the data file (already has everything as we need it)
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/Hyper/hyper" "${pkgdir}/usr/bin/hyper"
}
