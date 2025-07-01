# Maintainer: Max Harmathy <harmathy@secure.mailbox.org>
# Contributor: Arturo Penen <apenen@gmail.com>

pkgname=ghorg
pkgver=1.11.2
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94a98acdf9b79d9e19b2d91c9e74cf95914634f56a897a59e1c1584a87c9479b')

build() {
  cd $pkgname-$pkgver
  go build
}

package() {
  install -Dm 755 "$pkgname-$pkgver/ghorg" "$pkgdir/usr/bin/ghorg"

  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/$pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/$pkgname" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  install -dm 755 "$pkgdir/usr/share/fish/completions"
  "$pkgdir/usr/bin/$pkgname" completion fish > "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
