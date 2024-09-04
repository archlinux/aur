# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.67.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/jfrog/jfrog-cli"
license=("Apache-2.0")
conflicts=(jfrog-cli)
provides=(jfrog-cli)

_source_base="https://releases.jfrog.io/artifactory/$_pkgname/v2-jf/$pkgver"

source_x86_64=("jf-x64::$_source_base/$_pkgname-linux-amd64/jf")
source_i686=("jf-i686::$_source_base/$_pkgname-linux-386/jf")
source_armv7h=("jf-armv7h::$_source_base/$_pkgname-linux-arm/jf")
source_aarch64=("jf-aarch64::$_source_base/$_pkgname-linux-arm64/jf")

sha256sums_x86_64=('4a94bf053a6ab83602c32e83aba1bb9c0fd72fcea77ada9587361b2f3c7d31b7')
sha256sums_i686=('ed713e29436853e21514e72c4fd9dae3b62f89800642477a14821ce295f74e9c')
sha256sums_armv7h=('3ad0100a6c246377bc429df3a45b9a067bf3e4b73a33474dc6eb86f4294b284b')
sha256sums_aarch64=('923c199cadc82e93af67600d8ccdb152de0cd33307ac010c4b5eb08e4d8bf528')

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
