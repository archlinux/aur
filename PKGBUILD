pkgname=bricscad-fr_fr
pkgver=26.2.07
pkgrel=2
pkgdesc="Logiciel de CAO DWG"
arch=("x86_64")
url="https://bricscad.octave.com/fr"
license=('Custom:bricscad')
depends=(glibc cairo fontconfig libcups freetype2 gtk3 libxml2)
makedepends=(python-requests python-progressbar python-typing_extensions)
provides=('bricscad')
_lang=fr_FR
_os=2
_version=10160

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
    # libxml2 symlink
    ln -s /usr/lib/libxml2.so "${pkgdir}"/opt/bricsys/bricscad/v26/libxml2.so.2
    # Clean src for future build, prevent leftover file from previous versions
    rm -rf "${srcdir}"
}

md5sums=('b4348f91eb39c9a58ebec2c1967a3138'
         '0ffa034a065bdba7a6ee82636df51ff7')