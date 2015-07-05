#Contributor <Themaister> <maister@archlinux.us>
#Contributor <lifning> <definelightning@gmail.com>

pkgname=retroarch
_pkgname=RetroArch
pkgver=1.2
pkgrel=1
pkgdesc="Simple frontend for the libretro API. Stable version."

url="http://themaister.net/retroarch.html"
arch=('i686' 'x86_64')

license=('GPL')
optdepends=('libretro-super-git: A collection of many libretro implementations.')

conflicts=('retroarch-git')
provides=('retroarch-git')

source=("https://github.com/libretro/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ec4c9314d8ea8ef61294f30804ff05df')

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
