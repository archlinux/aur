# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.6.0
pkgrel=1
arch=('x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-x86_64.zip")
sha256sums=('923d84c0bae85135b7714bb39a3674f58c7d801dfa33e8645232cfc42c983320')


package() {
  # Checking the signature 
  COSIGN_EXPERIMENTAL=1 cosign verify-blob  --signature kwctl-linux-x86_64.sig --cert kwctl-linux-x86_64.pem kwctl-linux-x86_64

  # Copy the binary
  install -Dm755 "kwctl-linux-x86_64" "${pkgdir}/usr/bin/kwctl"
}