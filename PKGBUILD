# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Pedro Silva <psilva+git at pedrosilva dot pt>
# Contributor: Juri Grabowski <archlinux-aur at juri-grabowski dot de>

pkgname=blogc
pkgver=0.17.0
pkgrel=1
pkgdesc="A blog compiler"
arch=('x86_64')
url="https://blogc.rgm.io/"
license=('BSD')
depends=('glibc')
options=('!emptydirs')
source=("https://github.com/blogc/blogc/releases/download/v${pkgver}/blogc-${pkgver}.tar.gz")
sha256sums=('e985ba0a5504a8011c3af9a4d8ee845d42f10872a39ead2d653372c64902ef79')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-git-receiver \
    --enable-runserver
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
