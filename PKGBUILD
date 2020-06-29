# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard-git
pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r799.g497839b
pkgrel=1

pkgdesc='A simple interface to auto-configure neomutt and isync with safe passwords'
arch=('any')
url='https://github.com/lukesmithxyz/mutt-wizard'
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('git')
depends=('neomutt' 'isync' 'msmtp' 'notmuch-runtime' 'pass')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
            'cronie: auto-sync mails - alt.: fcron'
            'fcron: auto-sync mails - alt.: cronie'
            'libnotify: enable desktop notifications about new mail'
            'dunst: enable desktop notifications about new mail'
            'pam-gnupg: automatically unlock gpg keys at session login')

options=('zipman')

install="${pkgname%-git}.install"
source=("git+$url")
sha256sums=('SKIP')


package() {
  cd "${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
