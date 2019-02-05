# Maintainer: Thibaut Sautereau (thithib) <thibaut.sautereau@clip-os.org>

pkgname=swtpm
pkgver=0.1.0
pkgrel=1
pkgdesc="Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface"
arch=('x86_64')
url="https://github.com/stefanberger/swtpm"
license=('BSD')
depends=('glib2' 'fuse2' 'libtpms' 'openssl' 'gnutls' 'net-tools' 'tpm-tools' 'expect')
makedepends=('socat')
source=("https://codeload.github.com/stefanberger/swtpm/tar.gz/v${pkgver}")
sha256sums=('6b3a3beb12b9bcd286b07961062c2d03a71889be6eb26967fe13d3de62ad7a05')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --with-gnutls \
    --with-cuse \
    --with-chardev \
    --with-swtpm-setup \
    --with-vtpm-proxy \
    --with-openssl \
    --with-tss-user=tss \
    --with-tss-group=tss
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
