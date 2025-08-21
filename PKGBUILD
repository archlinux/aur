# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.78.5
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

sha256sums_x86_64=('82b89e93583814b89930bf9c1e011e6ebdac1ee8b6a8768a5bae97992b0b92ee')
sha256sums_i686=('55870810c754d1e9a6e8d5cbb5ccd14ca487acefd88c0ef07a317348b10f9af5')
sha256sums_armv7h=('24cfbc4e7ce1c572dad767c516834d1236e1ff7cd6bfedcfb55ea6efc924182b')
sha256sums_aarch64=('9682d497b4d17c2a4e12681411a237147b884d4e9152278673f359d16f3347ee')

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
