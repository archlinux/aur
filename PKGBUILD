# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper' 'hyper-appimage')
provides=('hyper')
depends=('libnotify' 'libxss' 'libxtst' 'gconf' 'libindicator' 'libappindicator')
options=('!strip' '!upx')

_pkgver_correct=${pkgver/\.canary/-canary}

source_x86_64=(
    "https://github.com/zeit/hyper/releases/download/${_pkgver_correct}/hyper_${_pkgver_correct}_amd64.deb"
)

md5sums_x86_64=(
    '51f3b3643c464b9bdef03ffede626126'
)

package() {
    # extract the data file (already has everything as we need it)
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/Hyper/hyper" "${pkgdir}/usr/bin/hyper"
}
