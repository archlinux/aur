# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Alexander Markov <apsheronets@gmail.com>
# Contributor: Winston Weinert

pkgname=cellwriter
pkgver=1.3.6
pkgrel=1
pkgdesc='A grid-entry natural handwriting input panel.'
arch=('x86_64')
license=('GPL')
url="https://github.com/risujin/${pkgname}"
depends=('gtk2' 'libxtst')
source=("https://github.com/risujin/${pkgname}/archive/${pkgver}.tar.gz"
        "https://launchpadlibrarian.net/18959127/${pkgname}-1.3.4-cellwidget-dont-disable-xinput.diff")
sha256sums=('17bb07226d4680b565b18a60494cb19cdf9067b427c8df7454c16d809de9963b'
            '6a8412319c35d5983c339b9406d52c5bdc102f001eb5aae17e10e33c6d8aa56a')

prepare() {
  cd ${pkgname}-${pkgver}/src
  patch -p0 < "${srcdir}/${pkgname}-1.3.4-cellwidget-dont-disable-xinput.diff"
}

build() {
  cd ${pkgname}-${pkgver}

  env LDFLAGS="-lX11" CFLAGS=" -fcommon" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
