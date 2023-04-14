# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=gaffer-bin
pkgver=1.2.3.0
pkgrel=1
pkgdesc="Gaffer is a VFX application that enables look developers, lighters, and compositors to easily build, tweak, iterate, and render scenes."
arch=('any')
url="https://www.gafferhq.org/"
license=('BSD-3')
depends=('python')
provides=('gaffer')
source=(https://github.com/GafferHQ/gaffer/releases/download/$pkgver/gaffer-$pkgver-linux.tar.gz)
noextract=("$provides-$pkgver-linux.tar.gz")
md5sums=('1e4a4a9559ab95e1fc0230533fc5a870')
options=('!strip')

prepare() {
  bsdtar xf "$provides-$pkgver-linux.tar.gz"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/mime/application"
  mkdir -p "${pkgdir}/usr/share/applications"

  mv "$provides-$pkgver-linux" "${pkgdir}/opt/gaffer"

  cp "$srcdir/../gaffer.desktop" "${pkgdir}/usr/share/applications/"
  cp "$srcdir/../x-gaffer.xml" "${pkgdir}/usr/share/mime/application/"

  ln -s "/opt/gaffer/graphics/GafferLogoMini.png" "${pkgdir}/usr/share/icons/gafferhq.png"

  ln -s "/opt/gaffer/bin/gaffer" "${pkgdir}/usr/bin/"

}
