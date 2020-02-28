# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: Fincer <fincer89@hotmail.com>

pkgname=pcsxr-gtk2
_pkgname=pcsxr
pkgver=1.9.92
pkgrel=2
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df project (Gtk2 version)'
arch=('i686' 'x86_64')
url='https://pcsxr.codeplex.com/'
license=('GPL')
conflicts=('pcsxr')
depends=('libcdio' 'libgl' 'libglade' 'libxtst' 'libxv' 'sdl')
makedepends=('mesa')
makedepends_i686+=('nasm')

# Accessible through /srv/ftp/other/community on nymeria.
source=("https://sources.archlinux.org/other/community/pcsxr/pcsxr-${pkgver}.tar.bz2"
"link_order.patch"
"static-declaration.patch")

md5sums=('28411aed0b4424f97227d94bdefaec83'
         'ce021bfc4c19e553a2cdb95b7ca1eb01'
         '0e679ab20973c11a2f943b3018db1e97')

build() {
    cd ${_pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}/link_order.patch"
    patch -Np1 -i "${srcdir}/static-declaration.patch"
    ./configure --prefix=/usr --enable-libcdio --enable-opengl
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
