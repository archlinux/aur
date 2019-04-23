# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Luke Smith <lukesmithxyz on git(hub|lab).com>

pkgname='mutt-wizard-git'
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r463.g426e637
pkgrel=1

pkgdesc='A simple interface to auto-configure neomutt and isync with safe passwords'
arch=('any')
url='https://github.com/lukesmithxyz/mutt-wizard'
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('neomutt' 'isync' 'msmtp' 'pass')
optdepends=('w3m: view HTML email and images inside of neomutt’s TUI'
           #'notmuch: index and search mail'  ##(neomutt depends on notmuch-runtime)
            'abook: contact store and tab completion'
            'cronie: auto-sync mails (alt.: fcron)'
            'fcron: auto-sync mails (alt.: cronie)')
makedepends=('git')

options=('zipman')

install="${pkgname%-git}.install"
changelog='CHANGELOG.md'
source=("git+$url")
sha256sums=('SKIP')

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.md
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
