# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname="light"
pkgname="${_pkgname}-browser"
_pkgver=42
pkgver=${_pkgver}.0
pkgrel=1
arch=('x86_64')
url="http://sourceforge.net/projects/lightfirefox/"
license=('unknown')
makedepends=('rpmextract')
source=("http://downloads.sourceforge.net/project/lightfirefox/${_pkgver}/light-${pkgver}.en-US.linux-x86_64.rpm")
md5sums=('7ef6a53af0473f6f2f61f2750b25fe53')
noextract=("light-${pkgver}.en-US.linux-x86_64.rpm")

package() {
    cd "$pkgdir"
    rpmextract.sh ../../light-${pkgver}.en-US.linux-x86_64.rpm
    mv usr/local/* usr/
    rm usr/local -rf
    rm usr/bin/light -f
    ln -s /usr/lib/light/light-bin usr/bin/light-browser
    sed -i 's/Exec=light/Exec=light-browser/g' usr/share/applications/mozilla-light.desktop
}

