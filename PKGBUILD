# Maintainer: sfs <sfslinux@gmail.com>

pkgname=akvis-alivecolors-bin
pkgver=10.0+svn4853.29044_jks351
pkgrel=1
pkgdesc="Powerful photo/image editing tool by AKVIS Lab"
arch=('x86_64')
url="https://alivecolors.com"
license=('custom')
depends=('glibc' 'gcc-libs' 'mesa' 'libglvnd' 'qt-akvis2')
makedepends=('wget' 'tar' 'libarchive')
sha256sums=('SKIP')

pkgver() {
    echo ${_pkgver} |sed 's/-/_/'
}

prepare() {
    _pkgver="`wget -q --output-document=- https://akvis-deb.sfo2.cdn.digitaloceanspaces.com/ |tr ">" "\n" |grep "</Key" |grep akvis-alivecolors-bin_1 |awk -F_ '{print $2}' |tail -1`"
    source=("https://akvis-deb.sfo2.cdn.digitaloceanspaces.com/pool/non-free/a/akvis-alivecolors-bin/akvis-alivecolors-bin_10.0+svn4853.29044-jks351_amd64.deb")
    wget "$source" -O ${pkgname}-${_pkgver}-1.deb &&
        bsdtar -xf ${pkgname}-${_pkgver}-1.deb &&
	tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
