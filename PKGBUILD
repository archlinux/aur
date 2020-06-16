# Maintainer: Max Christian Pohle <webmaster@coderonline.de>
pkgname=base16-vtrgb
pkgver=2020_06_16
pkgrel=1
pkgdesc="base16 color schemes available for the linux console (vt, tty)"
arch=('any')
url="https://github.com/coderonline/base16-vtrgb"
license=('MIT')
depends=(
  'systemd'
  'kbd'
  'mkinitcpio'
)
backup=('etc/vtrgb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coderonline/base16-vtrgb/archive/${pkgver//_/-}.tar.gz")
sha256sums=('1ec1d62d50ce18bd4893b6100214806dd441ca166f58f69d36d84bee622741dc')
install='base16-vtrgb.install'

package() {
    VERSION=${pkgver//_/-}
    cd ..
    mkdir -p pkg/${pkgname}/usr/share/kbd/
    mkdir -p pkg/${pkgname}/usr/lib/initcpio/hooks/
    mkdir -p pkg/${pkgname}/usr/lib/initcpio/install/
    mkdir -p pkg/${pkgname}/etc/
    cat /sys/module/vt/parameters/default_{red,grn,blu} > pkg/${pkgname}/etc/vtrgb
    cp -a src/base16-vtrgb-${VERSION}/initcpio/hooks/setvtrgb pkg/${pkgname}/usr/lib/initcpio/hooks/
    cp -a src/base16-vtrgb-${VERSION}/initcpio/install/setvtrgb pkg/${pkgname}/usr/lib/initcpio/install/
    cp -ar src/base16-vtrgb-${VERSION}/consolecolors pkg/${pkgname}/usr/share/kbd/
}

# vim: ft=bash
