# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Pedro Silva <psilva+git at pedrosilva dot pt>
# Contributor: Juri Grabowski <archlinux-aur at juri-grabowski dot de>

pkgname=blogc
pkgver=0.18.0
pkgrel=1
pkgdesc="A blog compiler"
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="https://blogc.rgm.io/"
license=('BSD')
depends=('glibc')
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v${pkgver}/blogc-${pkgver}.tar.gz")
sha256sums=('abd2a491e26d913b3c42b1f037ded173119a570b3458a75b68f6b57ccabec461')

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
