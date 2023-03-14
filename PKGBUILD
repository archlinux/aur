# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=tbls-bin
_name=${pkgname%-bin}
pkgver=1.63.0
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
arch=(x86_64)
url="https://github.com/k1LoW/tbls"
license=(MIT)
provides=("$_name")
conflicts=("$_name")

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/tbls_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('ccfe9e2af5c875e4fb76b67a34aba42ffcd4529570f6bb617ccdefddede0f20e')
noextract=("$pkgname-$pkgver.tar.gz")

_archive="$pkgname-$pkgver"

prepare() {
  mkdir -p "$_archive"
  tar -xf "$_archive.tar.gz" -C "$_archive"

  cd "$_archive"

  ./tbls completion bash > tbls.bash
  ./tbls completion fish > tbls.fish
  ./tbls completion zsh > tbls.zsh
}

package() {
  cd "$_archive"

  install -Dm755 tbls "${pkgdir}/usr/bin/tbls"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 tbls.bash "$pkgdir/usr/share/bash-completion/completions/tbls"
  install -Dm644 tbls.fish "$pkgdir/usr/share/fish/vendor_completions.d/tbls.fish"
  install -Dm644 tbls.zsh "$pkgdir/usr/share/zsh/site-functions/_tbls"
}
