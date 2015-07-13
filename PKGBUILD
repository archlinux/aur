# Author: wifiextender <aaron_caffrey at hotmail dot com>
# Maintainer: Alexandru Ianu <alexandru.ianu at gmail.com>

pkgname=pdf2img-c
pkgver=6.7003d7e
pkgrel=1
pkgdesc="Easily convert PDF to multiple image formats with a single click. C version of pdf2img."
arch=('any')
url="https://github.com/wifiextender/pdf2png"
license=('GPL3')
conflicts=('pdf2img' 'pdf2img-git')
replaces=('pdf2img')
depends=('gtk3' 'glibc' 'ghostscript')
makedepends=('git' 'pkg-config' 'gcc' 'gettext' 'intltool' 'autoconf')
source=('git+https://github.com/wifiextender/pdf2img-c.git')
md5sums=('SKIP')

build() {
  cd $srcdir/pdf2img-c/
  chmod +x bootstrap
  ./bootstrap
  chmod +x configure
  ./configure --prefix=/usr --enable-button-images
}

package() {
  cd $srcdir/pdf2img-c/
  make
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  cp $srcdir/pdf2img-c/src/pdf2img $pkgdir/usr/bin/
  cp $srcdir/pdf2img-c/pdf2img.desktop $pkgdir/usr/share/applications/
  cp $srcdir/pdf2img-c/pdf2img_c_icon.xpm $pkgdir/usr/share/pixmaps/
}

pkgver() {
  cd $srcdir/pdf2img-c/
  echo $(git rev-list --count master).$(git rev-parse --short master)
}