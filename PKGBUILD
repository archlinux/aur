# Maintainer: Michael Niewöhner <foss@mniewoehner.de>

pkgname=tpm-quote-tools
pkgver=1.0.4
pkgrel=3
pkgdesc="Tools for TPM remote attestation"
arch=('x86_64')
url="http://sf.net/projects/tpmquotetools"
license=('BSD')
depends=('trousers')
source=("tpm-quote-tools-${pkgver}.tar.gz::https://sourceforge.net/projects/tpmquotetools/files/${pkgver}/tpm-quote-tools-${pkgver}.tar.gz/download"
        "0001-Differentiate-between-owner-and-srk-well-known-passs.patch")
sha1sums=('dfbe967744833e76b7642b379bba2918d0a4263d'
          'a02f51d88bc803a8866b87c90a09110bbb367a92')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i ../0001-Differentiate-between-owner-and-srk-well-known-passs.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
