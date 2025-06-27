# Maintener: Fabio Gomes da Silva <fabiogsilva@disroot.org>
# Based on: 
# - https://aur.archlinux.org/packages/zijiang-pos58-driver
# - Originally maintained by: Alexander Sulfrian

pkgname=pos80-driver 
pkgver=1.0
pkgrel=1
pkgdesc='Driver for the POS80 thermal printer'
arch=('x86_64' 'i686')
url='http://www.zijiang.com/'
license=('custom')
makedepends=( cups unzip) 
depends=()
source=("linux-driver.zip::http://www.zjiang.com/asset/upload/14920711742402.zip")
sha256sums=('8faed310839377a479b62c1285ab3d9601270428e0b362ecd2e7cced02c24d92')



prepare() {
    # Unpack the installer script
    if [ $CARCH == "x86_64" ]; then
        sed -n -e '1,/^exit 0$/!p' Linux*/linux64*/install80 > package.tar.gz
    else
        sed -n -e '1,/^exit 0$/!p' Linux*/linux32*/install80 > package.tar.gz
    fi
    tar zxf "package.tar.gz"
}

package() {
    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    install "${srcdir}/bin/rastertozj"  "${pkgdir}/usr/lib/cups/filter/"

    mkdir -p "${pkgdir}/usr/share/cups/model/zijiang/"
    install -m0644 "${srcdir}/ppd/POS80.ppd" "${pkgdir}/usr/share/cups/model/zijiang/"
}