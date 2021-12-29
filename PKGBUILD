# Maintainer: alex4ip <alex4ip@gmail.com>
# Contiributer: Alex Ellis <alex@openfaas.com>

pkgname=arkade-bin
_pkgname=arkade
pkgver=0.8.11
pkgrel=1
epoch=1
pkgdesc='Your one-stop CLI for Kubernetes. provides a simple CLI with strongly-typed flags to install charts and apps to your cluster in one command.'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/alexellis/arkade/'
license=(MIT)
depends=('openssh')
#depends=('docker')
optdepends=('k3sup-bin'
            'k3s-bin'
            'kubernetes-bin'
            'helm'
            'terraform'
            'azure-cli: Command-line tools for Azure'
            'aws-cli: cli for Amazon Web Services'
            'google-cloud-sdk: gcloud - command-line tools for the Google Cloud Platform')
provides=('arkade')
#makedepends=('go')
_OWNER=alexellis

case "${CARCH}" in
  x86_64)    _CARCH=''        && sha256sums=('6eb47fa70180d79623accd24e92fc8de68c061fb9957a848c1e32abf91d4ad8b');;
  aarch64)   _CARCH='-arm64'  && sha256sums=('SKIP');;
  arm*)      _CARCH='-armhf'  && sha256sums=('SKIP');;
esac

source=("$pkgname-$pkgver::https://github.com/${_OWNER}/${_pkgname}/releases/download/${pkgver}/${provides}${_CARCH}")

package() {  
  install -Dm 755 "$srcdir/$pkgname-$pkgver" "${pkgdir}/usr/bin/${provides}"

  # install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  # install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  # "$pkgdir/usr/bin/provides" completion bash > "$pkgdir/usr/share/bash-completion/completions/provides"
  # "$pkgdir/usr/bin/provides" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_provides"
}

# vim:set ts=2 sw=2 et:
