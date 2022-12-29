# Maintainer: Max Christian Pohle <webmaster@coderonline.de>
pkgname=base16-vtrgb
pkgver=2022_12_29
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coderonline/base16-vtrgb/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('cd4b023b5b6d3ce302101393d198e5edf6c063c24f8e8c7efd05f91ce828cdc9')
install='base16-vtrgb.install'

package() {
    VERSION=${pkgver//_/-}
    cd ..
    mkdir -p pkg/${pkgname}/usr/share/kbd/
    mkdir -p pkg/${pkgname}/usr/lib/initcpio/hooks/
    mkdir -p pkg/${pkgname}/usr/lib/initcpio/install/
    mkdir -p pkg/${pkgname}/usr/lib/systemd/system/initrd.target.wants/
    mkdir -p pkg/${pkgname}/etc/
    cat /sys/module/vt/parameters/default_{red,grn,blu} > pkg/${pkgname}/etc/vtrgb
    cp -a src/base16-vtrgb-${VERSION}/initcpio/hooks/setvtrgb pkg/${pkgname}/usr/lib/initcpio/hooks/
    cp -a src/base16-vtrgb-${VERSION}/initcpio/install/setvtrgb pkg/${pkgname}/usr/lib/initcpio/install/
    cp -a src/base16-vtrgb-${VERSION}/initcpio/install/sd-setvtrgb pkg/${pkgname}/usr/lib/initcpio/install/
    cp -a src/base16-vtrgb-${VERSION}/setvtrgb.service pkg/${pkgname}/usr/lib/systemd/system/
    ln -sf ../setvtrgb.service pkg/${pkgname}/usr/lib/systemd/system/initrd.target.wants/setvtrgb.service
    cp -ar src/base16-vtrgb-${VERSION}/consolecolors pkg/${pkgname}/usr/share/kbd/
}

# vim: ft=bash
