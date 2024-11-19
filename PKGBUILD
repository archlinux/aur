# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.71.5
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

sha256sums_x86_64=('ee16e44d5cf65062d6709803fc3fa3b19b15ed34c649d5fe589de63601263f62')
sha256sums_i686=('b86bebdd08e872e89101ee007bd283b0e1d01cb9504a668f238bf9c5d3ceb2ae')
sha256sums_armv7h=('52ef7572c66234d557d8dc61832a0a6bbcbb6ea44f6d2e57dd6c33c80953a97d')
sha256sums_aarch64=('4d6b81a53a64701a0346945c6a81244786278ad72a7af8426883bf69841e8908')

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
