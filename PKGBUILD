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
pkgver=2.8.0
pkgrel=1
pkgdesc="Lasso is a free software C library aiming to implement the Liberty Alliance standards. ID-WSF and SAML 2.0."
arch=('i686' 'x86_64')
url="http://lasso.entrouvert.org/"
license=('GNU')
depends=('libxml2' 'xmlsec' 'openssl')
makedepends=('perl' 'python-six')
source=("https://dev.entrouvert.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d1b26608ea7cd08e4e2c40cec0ddc41e3235fd5c2cee64d989ae752bbbc276fe056455e3943a778abcc7f8e8596c85beada75df4290579e6af15e82d0e2fb5ca')

build() {
  cd "${pkgname}"-"${pkgver}"
  ./configure --prefix=/usr --disable-tests
  make CFLAGS="-g -O2 -w" CXXFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README  "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
