# Maintainer:         0fflineuser <0fflineuser@cock.li>
# Contributor:        Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Upstream author :   Luke Smith <https://git{hub,lab}.com/lukesmithxyz/>

pkgname=mutt-wizard-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgver=3.3.1.r162.gb7b7f21
pkgrel=1

pkgdesc='Easily auto-configure neomutt and isync/mpop with safe passwords (IMAP/POP3/SMTP)'
arch=('any')
url="https://github.com/lukesmithxyz/$_name"
license=('GPL3')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('neomutt' 'isync' 'msmtp' 'notmuch-runtime' 'pass' 'curl' 'libnotify' 'perl')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'urlview: list URLs found in mails to open them in a browser'
            'abook: contact store and tab completion'
            'protonmail-bridge: use neomutt with protonmail accounts'
            'pam-gnupg: automatically unlock gpg keys at session login'
            'cron: set up automatic mail syncing'
            'mpop: if you want to use POP3 email access')

options=('zipman')

install="$_name.install"
source=("git+$url")
sha256sums=('SKIP')


package() {
  cd "$_name"
  make PREFIX=/usr DESTDIR="$pkgdir" -s install
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
