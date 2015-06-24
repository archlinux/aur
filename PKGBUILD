#Contributor <Themaister> <maister@archlinux.us>
#Contributor <lifning> <definelightning@gmail.com>

pkgname=retroarch
_pkgname=RetroArch
pkgver=1.0.0.3
_pkgtag=-beta
pkgrel=1
pkgdesc="Simple frontend for the libretro API. Stable version."

url="http://themaister.net/retroarch.html"
arch=('i686' 'x86_64')

license=('GPL')
optdepends=('libretro-super-git: A collection of many libretro implementations.')

conflicts=('retroarch-git')
provides=('retroarch-git')

source=("https://github.com/libretro/${_pkgname}/archive/${pkgver}${_pkgtag}.tar.gz")
md5sums=('3d3ebf02c7b19bc8c02329ec827349f9')

backup=('etc/retroarch.cfg')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}${_pkgtag}"
    ./configure --prefix=/usr && make || return 1
}

package() {
    mkdir -p "${pkgdir}/etc"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/man/man1"
    cd "${srcdir}/${_pkgname}-${pkgver}${_pkgtag}"
    make install DESTDIR=${pkgdir} || return 1
}
