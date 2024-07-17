# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: tocer.deng <tocer.deng@gmail.com>

pkgname=apvlv
pkgver=0.6.0
pkgrel=1
pkgdesc="A PDF/DJVU/EPUB viewer which behaves like Vim"
arch=('x86_64')
url="https://github.com/naihe2010/apvlv"
license=('GPL-2.0-or-later')
depends=('cairo'
         'djvulibre'
         'ebook-tools'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'libxml2'
         'pango'
         'poppler-glib'
         'webkit2gtk')
backup=('etc/apvlvrc')
makedepends=('cmake' 'freetype2' 'ghostscript')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}-final.tar.gz")
sha256sums=('8cec385df3b8655c19710de4d29220a4739c04b97906a8f07f97b6b17747680c')

build() {
  cmake -B build -S "${pkgname}-${pkgver}-final" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAPVLV_WITH_DJVU=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -d "${pkgdir}/usr/share/man/man1"
  mv "${pkgdir}/usr/share/man/apvlv.1" "${pkgdir}/usr/share/man/man1"
}
