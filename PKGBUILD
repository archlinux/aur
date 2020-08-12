# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Wesley Moore <wes@wezm.net>


pkgname=mdcat-bin
_pkgname="${pkgname%-bin}"

pkgver=0.21.0
pkgrel=1

pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('x86_64')
url="https://github.com/lunaryorn/${pkgname%-bin}"
license=('MPL2')

provides=("$_pkgname")
conflicts=("$_pkgname")

makedepends=('curl')
optdepends=('curl: fetch images via http/https'
            'terminology: optional terminal emulator for image support'
            'kitty: optional terminal emulator for image support'
            'librsvg: render svg images in kitty')

changelog=CHANGELOG.md
_srcname="$_pkgname-$pkgver-x86_64-unknown-linux-musl"
source=("$url/releases/download/$_pkgname-$pkgver/$_srcname.tar.gz")
b2sums=($(curl -sL "$url/releases/download/$_pkgname-$pkgver/B2SUMS.txt" | \
           grep "$_srcname" | cut -d\  -f1))


package() {
  cd "$_srcname"
  install -Dm755 "$_pkgname"                  -t"$pkgdir/usr/bin/"
  install -Dm755 {README,CHANGELOG}.md        -t"$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 "completions/_$_pkgname"     -t"$pkgdir/usr/share/zsh/site-functions/"
  install -Dm644 "completions/$_pkgname.fish" -t"$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 "completions/$_pkgname.bash"   "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
