#Contributor <Themaister> <maister@archlinux.us>
#Contributor <lifning> <definelightning@gmail.com>

pkgname=retroarch
_pkgname=RetroArch
pkgver=1.2.2
pkgrel=2
pkgdesc="Simple frontend for the libretro API. Stable version."

url="http://www.libretro.com/"
arch=('i686' 'x86_64')

license=('GPL')
depends=('libgl')

conflicts=('retroarch-git')
provides=('retroarch-git')

source=("https://github.com/libretro/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('09d9d6307334b353cb342dea52b42207')

backup=('etc/retroarch.cfg')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr && make || return 1
}

package() {
    mkdir -p "${pkgdir}/etc"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make install DESTDIR=${pkgdir} || return 1
}
