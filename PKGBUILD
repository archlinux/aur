# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=clauth-bin
_pkgname=clauth
pkgver=0.17.0
pkgrel=1
pkgdesc="Claude Code multi-account manager and usage monitor with auto-switch (prebuilt binary)"
arch=('x86_64')
url="https://github.com/uwuclxdy/clauth"
license=('MIT')
depends=('glibc' 'libgcc')
optdepends=('claude-code: clauth start, resume, delegate and the Claude Code plugin'
            'openai-codex: codex profiles'
            'herdr: pane tags and the herdr plugin'
            'inetutils: hostname lookup for the daemon --listen certificate')
provides=('clauth')
conflicts=('clauth')
options=('!strip' '!debug')
source=("LICENSE-$_pkgname-$pkgver::https://raw.githubusercontent.com/uwuclxdy/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/uwuclxdy/$_pkgname/releases/download/v$pkgver/$_pkgname-linux-x86_64")
sha256sums=('cdda746ab9906de0e39936a41b1eabf9dd2c8790715c14b4ea5285abbcfec17f')
sha256sums_x86_64=('8a1e04bfc84c69dabae70b5370dc4034603e5b33b2beb62f516d19b24f77cc7c')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$_pkgname-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _home="$srcdir/completions-home"
  mkdir -p "$_home"
  HOME="$_home" "$pkgdir/usr/bin/$_pkgname" completions bash |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  HOME="$_home" "$pkgdir/usr/bin/$_pkgname" completions zsh |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  HOME="$_home" "$pkgdir/usr/bin/$_pkgname" completions fish |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
