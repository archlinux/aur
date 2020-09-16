# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Pedro Silva <psilva+git at pedrosilva dot pt>
# Contributor: Juri Grabowski <archlinux-aur at juri-grabowski dot de>

pkgname=blogc
pkgver=0.20.0
pkgrel=1
pkgdesc="A blog compiler"
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="https://blogc.rgm.io/"
license=('BSD')
depends=('glibc')
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v${pkgver}/blogc-${pkgver}.tar.gz")
sha256sums=('189e0fd21d01db950727fd2121bdaea71aa087527d704a7c13f9bcf1cffb95fb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-git-receiver \
    --enable-runserver \
    --enable-make
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
