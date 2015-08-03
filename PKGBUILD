# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Kevin Klement = klement at philos dot umass dot edu

pkgname=rtf2latex2e
pkgver=2.2.2
dashedver=${pkgver//./-}
pkgrel=1
pkgdesc="Tool to convert rich text format (RTF) documents to LaTeX 2e format."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/rtf2latex2e/"
license=('GPL')
optdepends=('texlive-core: To make use of LaTeX output files' 'unoconv: to convert EMF, WMF and PICT images to PDF')

source=(http://downloads.sourceforge.net/$pkgname/files/$pkgname-$dashedver.tar.gz)
md5sums=('8aa606410aeb92583e8e06c39e34f5e8')
sha512sums=('be021399d84f0f8d82f0387e1b1fd12f100afe83f9a374f0dc19ad9f4066720f25cd6a856a1f64f7468d9d11c52cbec1941c223fa92e5dabba3c22d7f4370455')

prepare() {
  cd "${srcdir}/$pkgname-$dashedver"
  sed -i 's/prefix?=\/usr\/local/prefix?=\/usr/g' Makefile
}

build() {
  cd "${srcdir}/$pkgname-$dashedver"
  make
}

check() {
  cd "${srcdir}/$pkgname-$dashedver"
  make test
}

package() {
  cd "${srcdir}/$pkgname-$dashedver"
  make DESTDIR="${pkgdir}" install
}
