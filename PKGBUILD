# Maintainer: Jguer <joaogg3@gmail.com>
pkgname=base16-vtrgb
pkgver=2020_05_24
pkgrel=1
pkgdesc="base16 color schemes available for the virtual terminal (vt, tty)"
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
sha256sums=('b7b1c9906b219ee7b4c7b6f34585dc50b8d1ffa3378826c287f20cc7af99b594')
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
