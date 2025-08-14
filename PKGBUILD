# Maintainer: Axel McLaren <scm(at)axml(dot)uk>
# Contributor: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: totoloco <totoloco at gmx>

pkgname=tabbed
pkgver=0.9
pkgrel=1
pkgdesc='simple generic tabbed frontend to xembed-aware applications'
arch=('x86_64')
url='https://tools.suckless.org/tabbed'
license=('custom:MIT/X')
depends=('libx11' 'libxft')
install='tabbed.install'
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz"
        'config.h')
sha256sums=('0acf87457b7419e66fbfa3a9cec95ffb46d254c6b88b5e4bb7cc18c3a92008a8'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cp "${srcdir}/config.h" config.h

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
