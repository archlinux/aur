# Maintainer: Max Christian Pohle <webmaster@coderonline.de>
pkgname=base16-vtrgb
pkgver=2021_10_06
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
sha256sums=('9b8a333776b16603d10f35eb07e185364cb5d8496fe433088faecc0105135028')
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
