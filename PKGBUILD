# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Roland Puntaier <roland [dot] puntaier [at] gmail [dot] com>
# Upstream author :  Luke Smith <luke [at] lukesmith [dot] xyz>

pkgname='mailwizard-git'
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r723.b52a03b
pkgrel=1

pkgdesc='Configure neomutt, isync, getmail and msmtp with pass for passwords'
arch=('any')
url="https://github.com/rpuntaie/${pkgname%-git}"
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'mutt-wizard')

makedepends=('git')
depends=('neomutt' 'isync' 'getmail' 'msmtp' 'pass' 'urlscan')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'abook: contact store and tab completion'
            'cronie: auto-sync mails - alt.: fcron'
            'fcron: auto-sync mails - alt.: cronie'
            'pam-gnupg: automatically unlock gpg keys at session login')
#checkdepends=('bash-bats')

options=('zipman')

changelog=changelog.txt
source=("git+$url")
sha256sums=('SKIP')

#check() {
#  cd "${pkgname%-git}"
#  ./dotests
#}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" -s install
  install -Dm644 -t"$pkgdir/usr/share/doc/${pkgname%-git}/" README.rst
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
