# Author: wifiextender <aaron_caffrey at hotmail dot com>
# Maintainer: Alexandru Ianu <alexandru.ianu at gmail.com>

pkgname=pdf2img-c
pkgver=90.9b4c3e1
pkgrel=1
pkgdesc="Easily convert PDF to multiple image formats with a single click. C version of pdf2img."
arch=('any')
url="https://github.com/wifiextender/pdf2png"
license=('GPL3')
conflicts=('pdf2img' 'pdf2img-git')
replaces=('pdf2img')
depends=('gtk3' 'glibc' 'ghostscript')
makedepends=('git' 'pkg-config' 'gcc')
source=('git+https://github.com/wifiextender/pdf2png.git')
md5sums=('SKIP')

build() {
  cd $srcdir/pdf2png/C-version/
  make
}

package() {
  cd $srcdir

  # Start file
  install -Dm755 pdf2png/C-version/pdf2img $pkgdir/usr/bin/pdf2img

  # Desktop icon
  install -Dm644 pdf2png/pygtk3/img/Pdf2img.desktop $pkgdir/usr/share/applications/pdf2img.desktop
  install -Dm644 pdf2png/C-version/img/pdf2img_icon.png $pkgdir/usr/share/icons/pdf2img_icon.png
}

pkgver() {
  cd $srcdir/pdf2png
  echo $(git rev-list --count master).$(git rev-parse --short master)
}