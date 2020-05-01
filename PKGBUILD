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
md5sums=('826de84d6d9f00a9c25e892986287f58'
         '5e8c61309c5ec8f67f0af7bb5ceb1aea')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  patch -p0 < "${srcdir}/${pkgname}-1.3.4-cellwidget-dont-disable-xinput.diff"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  env LDFLAGS='-lX11' ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
