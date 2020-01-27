# Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=f27-backgrounds
pkgver=27.0.1
_string=$(curl -sL "https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f" | grep "${pkgname}" | cut -d '"' -f 6)
_rhver=$(echo ${_string} | sed "s/${pkgname}-//g" | sed 's/.src.rpm//g')
pkgrel=$(echo ${_rhver} | cut -d '-' -f 2| sed 's/.fc[0-9]*//g')
pkgdesc="Fedora 27 backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/F27_Artwork"
license=("CC-BY-SA")
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('SKIP')

pkgver() {
  echo $_string | cut -d '-' -f 3
}

prepare()  {
    tar -xf ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}-${pkgver}.tar.xz
    rm -r ./${pkgname}.spec
}

build() {
    cd ./${pkgname}
    make
}

package() {    
    cd ./${pkgname}
    make install DESTDIR="${pkgdir}"
}
