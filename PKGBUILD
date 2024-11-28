# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.72.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/jfrog/jfrog-cli"
license=("Apache-2.0")
conflicts=(jfrog-cli)
provides=(jfrog-cli)

_source_base="https://releases.jfrog.io/artifactory/$_pkgname/v2-jf/$pkgver"

source_x86_64=("jf-${pkgver}-x64::$_source_base/$_pkgname-linux-amd64/jf")
source_i686=("jf-${pkgver}-i686::$_source_base/$_pkgname-linux-386/jf")
source_armv7h=("jf-${pkgver}-armv7h::$_source_base/$_pkgname-linux-arm/jf")
source_aarch64=("jf-${pkgver}-aarch64::$_source_base/$_pkgname-linux-arm64/jf")

sha256sums_x86_64=('02ecf847a403725e93d13fb4b28c66a0a4fd99b7e17f45a2ec46fac426dd5846')
sha256sums_i686=('ace52a95bd6e0f5e0dff6301383bebe77be69bcbbb6cdcdec740c85872025973')
sha256sums_armv7h=('8545661e993adf056fde667bd35e4b7c27dd46907f5bb1bc24335fc5384e51da')
sha256sums_aarch64=('910da59474215c1461c0c0308304cd427189a4411299f6fead8594c2a806afbb')

noextract=("${source[@]%%::*}")

package() {
  install -Dm755 jf-* "$pkgdir/usr/bin/jf"
  ln -rs "$pkgdir/usr/bin/jf" "$pkgdir/usr/bin/jfrog"

  install -Dm644 <($pkgdir/usr/bin/jf completion bash) "$pkgdir/usr/share/bash-completion/completions/jfrog"
  install -Dm644 <($pkgdir/usr/bin/jf completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/jfrog.fish"
  install -Dm644 <($pkgdir/usr/bin/jf completion zsh) "$pkgdir/usr/share/zsh/site-functions/_jfrog"
  install -Dm644 <($pkgdir/usr/bin/jf completion bash) "$pkgdir/usr/share/bash-completion/completions/jf"
  install -Dm644 <($pkgdir/usr/bin/jf completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/jf.fish"
  install -Dm644 <($pkgdir/usr/bin/jf completion zsh) "$pkgdir/usr/share/zsh/site-functions/_jf"
}
