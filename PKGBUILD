# Maintainer:

pkgname=wkhtmltopdf
pkgver=0.12.6
pkgrel=1
pkgdesc="Command line tools to render HTML into PDF and various image formats"
arch=('x86_64')
url="https://wkhtmltopdf.org/"
license=('LGPL3')
depends=('qt5-webkit' 'qt5-svg' 'qt5-xmlpatterns')
makedepends=('git')
optdepends=('xorg-server: wkhtmltopdf needs X or Xvfb to operate')
source=("git+https://github.com/wkhtmltopdf/wkhtmltopdf.git#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('76C0969C076A23EC4849F462D3E3E8ACF99DE8EA') # Ashish Kulkarni (Open Source) <ashish@kulkarni.dev>

build() {
  cd $pkgname
  qmake-qt5 wkhtmltopdf.pro
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir/usr" install

  # Generate and install man pages
  install -d "$pkgdir/usr/share/man/man1"
  LD_LIBRARY_PATH=bin ./bin/wkhtmltopdf --manpage \
    >"$pkgdir/usr/share/man/man1/wkhtmltopdf.1"
  LD_LIBRARY_PATH=bin ./bin/wkhtmltoimage --manpage \
    >"$pkgdir/usr/share/man/man1/wkhtmltoimage.1"
}

# vim:set ts=2 sw=2 et:
