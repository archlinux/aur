# Maintainer: Dominic Giebert <dominic.giebert@gmail.com>

pkgname=kwctl-bin
pkgdesc='kwctl is the go-to CLI tool for Kubewarden users'
pkgver=1.7.0
pkgrel=2
arch=('x86_64')
license=('Apache')
url='https://www.kubewarden.io/'
makedepends=('cosign')
provides=('kwctl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kubewarden/kwctl/releases/download/v${pkgver}/kwctl-linux-x86_64.zip")
sha256sums=('fd245767a6e7b46cb51467290640fe542e42a0802b8e2e2d6b94675ff47dd431')


package() {
  # Checking the signature
  cosign verify-blob \
    --signature kwctl-linux-x86_64.sig \
    --cert kwctl-linux-x86_64.pem kwctl-linux-x86_64 \
    --certificate-identity-regexp 'https://github.com/kubewarden/*' \
    --certificate-oidc-issuer https://token.actions.githubusercontent.com

  # Copy the binary
  install -Dm755 "kwctl-linux-x86_64" "${pkgdir}/usr/bin/kwctl"
}