# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=gaffer-bin
pkgver=1.0.5.1
pkgrel=1
pkgdesc="Gaffer is a VFX application that enables look developers, lighters, and compositors to easily build, tweak, iterate, and render scenes."
arch=('any')
url="https://www.gafferhq.org/"
license=('BSD-3')
depends=('python')
provides=('gaffer')
source=(https://github.com/GafferHQ/gaffer/releases/download/$pkgver/gaffer-$pkgver-linux-python3.tar.gz)
noextract=("$provides-$pkgver-linux-python3.tar.gz")
md5sums=('fc0fb47ce1deefd7dfe9123486eae6e8') #autofill using updpkgsums
options=('!strip')

prepare() {
  bsdtar xf "$provides-$pkgver-linux-python3.tar.gz"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons"
  mkdir -p "${pkgdir}/usr/share/mime/application"
  mkdir -p "${pkgdir}/usr/share/applications"

  mv "$provides-$pkgver-linux-python3" "${pkgdir}/opt/gaffer"

  cp "$srcdir/../gaffer.desktop" "${pkgdir}/usr/share/applications/"
  cp "$srcdir/../x-gaffer.xml" "${pkgdir}/usr/share/mime/application/"

  ln -s "/opt/gaffer/graphics/GafferLogoMini.png" "${pkgdir}/usr/share/icons/gafferhq.png"

  ln -s "/opt/gaffer/bin/gaffer" "${pkgdir}/usr/bin/"

}
