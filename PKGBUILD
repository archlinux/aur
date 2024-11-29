# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.72.2
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

sha256sums_x86_64=('573727543981192843c904d14b1a8e4e9a1961a481f8ce00e67c8688911cf428')
sha256sums_i686=('9e5c19e96c3fa82b52b237674b6877e538f801307d6b7f5e0975f2bd6e7934b5')
sha256sums_armv7h=('1fc301c4d46a7a5994f092f31824decc25d49bf9f7ad33937f1338b6e60fc35b')
sha256sums_aarch64=('eaa33c60162daf2f87ecdcf0d2e340e344f377890f041927f66333f36abb2c09')

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
