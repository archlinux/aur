# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.73.2
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

sha256sums_x86_64=('7c03287c17a04097279cd927e5ef93fe9e61d2e2958e93339f4e26a8ccb6652e')
sha256sums_i686=('e024d414d427871654f2dba97e77633711274dce98cc88712bfe90d88870ed3c')
sha256sums_armv7h=('aa95faf77f7c5bf0ee8e11f01a186d9dcf6969dd314dc913debcb6b747770e7c')
sha256sums_aarch64=('d6fd8ab75a1f04ec78f30ef2fbbd7febbc6c38140908530012676cb896bdb659')

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
