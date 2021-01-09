# Maintainer :       Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :  Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>


pkgname=mutt-wizard-git
pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgver=3.1.1.r2.gc5dcb95
pkgrel=1

pkgdesc='Simple interface to auto-configure neomutt and isync with safe passwords'
arch=('any')
url="https://github.com/lukesmithxyz/${pkgname%-git}"
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('git')
depends=('neomutt' 'isync' 'msmtp' 'notmuch-runtime' 'pass' 'curl')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
            'protonmail-bridge: use neomutt with protonmail accounts'
            'pam-gnupg: automatically unlock gpg keys at session login'
            'cron: set up automatic mail syncing')

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
