# Maintainer: Archer <NAME at gmx dot com>
# Contributor: Army
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.9.0
pkgrel=3
pkgdesc="Conky command line, without X11 dependencies"
url="http://conky.sourceforge.net/"
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
provides=('conky')
conflicts=('conky')
depends=('ncurses' 'wireless_tools')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --disable-lua --disable-x11 \
      --disable-double-buffer \
      --disable-xdamage \
      --disable-own-window \
      --disable-xft \
      --disable-hddtemp \
      --disable-portmon \
      --enable-wlan \

  make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
md5sums=('1c8e715a2784d4d799f5fc0213e76d0f')
