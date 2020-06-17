# Maintainer      :  Ahmad Ansori Palembani <https://github.com/null2264/>

pkgname=mutt-wizard-zi-git
pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r774.ge69a7ad
pkgrel=2

pkgdesc='A simple interface to auto-configure neomutt and isync with safe passwords'
arch=('x86_64')
url='https://github.com/null2264/mutt-wizard-zi'
license=('GPL3')

provides=("mutt-wizard")
conflicts=("mutt-wizard")

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
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" README.md
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
