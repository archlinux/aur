pkgname=libxft-brga
pkgver=2.3.3
pkgrel=1
pkgdesc="Modified libXft with BRGA & scaling patches by Maxime Coste to support color emoji"
arch=('x86_64')
license=('custom')
group=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://xorg.freedesktop.org/"
depends=('fontconfig' 'libxrender')
makedepends=('pkgconfig')
source=(${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2{,.sig}
	'https://gitlab.freedesktop.org/xorg/lib/libxft/merge_requests/1.patch')
sha512sums=('28fdaf3baa3b156a4a7fdd6e39c4d8026d7d21eaa9be27c9797c8d329dab691a1bc82ea6042f9d4729a9343d93787536fb7e4b606f722f33cbe608b2e79910e8'
            'SKIP'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

prepare() {
  pushd libXft-${pkgver}
  patch -p1 < ../1.patch
  popd
}

build() {
  cd libXft-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd libXft-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

}
