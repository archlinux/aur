# Maintainer: Nikola Ivačič <nikola.ivacic@dropchop.com>
### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=lasso
pkgver=2.5.1
pkgrel=1
pkgdesc="Lasso is a free software C library aiming to implement the Liberty Alliance standards. ID-WSF and SAML 2.0."
arch=('i686' 'x86_64')
url="http://lasso.entrouvert.org/"
license=('GNU')
depends=('libxml2' 'xmlsec' 'openssl')
makedepends=('perl' 'python-six' 'jdk')
source=("https://dev.entrouvert.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f20bea62c04f3082d5c423f658bafe1bdde0012321c43092ed5d5a2c3ec7b21ec27d88d9fc630743fd7c99e767d9fd92b98de5d4f7d98c3a9e680717483daae1')

build() {
  cd "${pkgname}"-"${pkgver}"
  ./configure --prefix=/usr
  make CFLAGS="-g -O2 -w" CXXFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README  "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
