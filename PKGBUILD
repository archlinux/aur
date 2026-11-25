pkgname=bricscad-fr_fr
pkgver=27.1.06
pkgrel=1
pkgdesc="Logiciel de CAO DWG"
arch=("x86_64")
url="https://bricscad.octave.com/fr"
license=('Custom:bricscad')
depends=(glibc cairo fontconfig libcups freetype2 gtk3 libxml2)
makedepends=(python-requests python-progressbar python-typing_extensions)
provides=('bricscad')
_lang=fr_FR
_os=2
_version=10533

### Check rpm dependencies
#sudo pacman -S rpm-tools
#rpm -qpR BricsCAD-V25.1.07-1-fr_FR.x86_64.rpm
###

# To download you must be logged in. The official website has no permanent link.
DLAGENTS=("https::/usr/bin/python $PWD/dlagent.py %u %o $_os $_version")

source=(
    dlagent.py
    "BricsCAD-V${pkgver}-1-${_lang}.${arch}.rpm::${url}"
)

package() {
    cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
    cp -dr --no-preserve=ownership ./opt "${pkgdir}"/
    cp -dr --no-preserve=ownership ./var "${pkgdir}"/
    # Allow creation of licence file for anyone
    chmod -R 757 "${pkgdir}"/var/bricsys
    # Clean src for future build, prevent leftover file from previous versions
    rm -rf "${srcdir}"
}

md5sums=('f676c62f18e63da55d83ce4185b9b0b3'
         '5d38d8f407da91a2d1591c45f402cf1c')