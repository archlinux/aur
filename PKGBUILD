# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: polyzen <polycitizen@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-extension-privacy-badger-git
_gitname=privacybadgerfirefox
pkgver=0.2.5.r147.g72e9ac2
pkgrel=1
pkgdesc='Blocks spying ads and invisible trackers.'
license=('custom:GPLv3+')
arch=('any')
url='https://www.eff.org/privacybadger'
depends=('firefox')
makedepends=('addon-sdk' 'git')
provides=('firefox-extension-privacybadger')
conflicts=('firefox-extension-privacybadger')
options=('!emptydirs')
source=("git://github.com/EFForg/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    /opt/addon-sdk/bin/cfx xpi --output-file ../privacybadger-${pkgver}.xpi
}

package() {
    cd "${srcdir}"

    _dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/jid1-MnnxcxisBPnSXQ@jetpack"
    install -d "${_dstdir}"
    unzip -qqo -d "${_dstdir}" privacybadger-${pkgver}.xpi

    install -Dm644 "${_gitname}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
