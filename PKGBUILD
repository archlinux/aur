# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.5.3
pkgrel=2
arch=('x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-x86_64.zip")
sha256sums=('4b19ac4bf058345f38c63008f4079eae804cb159de0ea6fa37477790634dc72f')


package() {
  # Checking the signature 
  COSIGN_EXPERIMENTAL=1 cosign verify-blob  --signature kwctl-linux-x86_64.sig --cert kwctl-linux-x86_64.pem kwctl-linux-x86_64

  # Copy the binary
  install -Dm755 "kwctl-linux-x86_64" "${pkgdir}/usr/bin/kwctl"
}