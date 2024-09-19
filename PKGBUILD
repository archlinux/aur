# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.68.0
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

sha256sums_x86_64=('6d08e238a372cffea67cd1b1a40fb86feee3b0e26e24e005133328a340401712')
sha256sums_i686=('7b8d59f4bf75fff377717eb9131609e4fc413808c48219f5f393a79524b7a680')
sha256sums_armv7h=('ab27629f1c56c150c54e596f1ea90ffd4664c574a1dac8a0635d30efc9ede743')
sha256sums_aarch64=('b09393877b2217e3fd122f4ff170741c36934f291de69073a3bb89c8598e6394')

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
