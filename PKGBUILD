# Maintainer: Vi0L0 <vi0l093@gmail.com>
# Contributor: mid-kid <esteve.varela@gmail.com>

pkgname="amdoverdrivectrl"
_pkgname="AMDOverdriveCtrl"
pkgver=1.2.7
pkgrel=3
pkgdesc="Tool for controling the frequency and fan settings of AMD/ATI video cards."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/amdovdrvctrl"
license=('GPL')
depends=('catalyst-utils' 'wxgtk2.8>=2.8.10')
makedepends=('amd-adl-sdk')
options=('!strip')
source=("http://sourceforge.net/projects/amdovdrvctrl/files/C%2B%2B%20sources/AMDOverdriveCtrl.${pkgver}.tar.bz2")
md5sums=('556cbe675267badb54c5a0dba10ff9f1')

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i -e 's/wx-config/wx-config-2.8/g' makefile configure
    ln -s /usr/include/ADL ADL_SDK/include
    ./configure
}

build() {
    cd "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR=$pkgdir install
} 
