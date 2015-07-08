# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Ivan Petruk <localizator@ukr.net>

_i686_code=XZDxIkZSrlWwLJDtWJPQJ0tuzqE8pB3Mw9V
_x86_64_code=XZWxIkZuAkt4AQ9bT05r3TpMKN8lSYnEyfV
_api_url="https://api.pcloud.com/getpublinkdownload?code="
pkgname=pcloud
pkgver=3.0.1
pkgrel=1
pkgdesc='A QT-based pcloud sync client'
arch=('i686' 'x86_64')
url="https://www.pcloud.com"
license=('unknown')
makedepends=('jq')
depends=('qt4')
conflicts=('pcloud-git')
replaces=('pcloud-git')
source_i686="https://www.pcloud.com" # Placeholder
source_x86_64="https://www.pcloud.com" # Placeholder
sha1sums_i686=('62ab9e9737c14a06780526cbfa9fa000f77f2450')
sha1sums_x86_64=('265c085c3e971a1a63dfbe1a43ffee3f35fa8009')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.gz
}


package() {
    cd "${srcdir}"
    install -Dm755 usr/bin/psyncgui "${pkgdir}/usr/bin/psyncgui"
    install -Dm644 usr/share/doc/pclsync/copyright "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 usr/share/applications/pclsync.desktop "${pkgdir}/usr/share/applications/pclsync.desktop"
    install -Dm644 usr/share/menu/pclsync "${pkgdir}/usr/share/menu/pclsync"
    install -Dm644 usr/share/pixmaps/pcloud-icon.svg "${pkgdir}/usr/share/pixmaps/pcloud-icon.svg"
}

case ${CARCH} in
    i686) source_i686=("http://$(curl "${_api_url}${_i686_code}" 2> /dev/null | jq -r '.hosts[0] + .path')") ;;
    x86_64) source_x86_64=("http://$(curl "${_api_url}${_x86_64_code}" 2> /dev/null | jq -r '.hosts[0] + .path')") ;;
esac
