# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Roland Puntaier <roland [dot] puntaier [at] gmail [dot] com>
# Upstream author :  Luke Smith <luke [at] lukesmith [dot] xyz>


pkgname=mailwizard

pkgver=2.0.5
pkgrel=1

pkgdesc='Configure neomutt, isync, getmail and msmtp with pass for passwords'
arch=('x86_64')
url="https://github.com/rpuntaie/$pkgname"
license=('GPL3')

conflicts=('mutt-wizard')

depends=('neomutt' 'isync' 'getmail6' 'msmtp' 'notmuch-runtime' 'pass' 'urlscan')
optdepends=('imagemagick: view images inside of the neomutt TUI'
            'w3m: view HTML email and images inside of the neomutt TUI'
            'lynx: view HTML email inside of the neomutt TUI'
            'links: view HTML email inside of the neomutt TUI'
            'elinks: view HTML email inside of the neomutt TUI'
            'abook: contact store and tab completion'
            'cronie: auto-sync mails - alt.: fcron'
            'fcron: auto-sync mails - alt.: cronie'
            'libnotify: enable desktop notifications about new mail'
            'dunst: enable desktop notifications about new mail'
            'pam-gnupg: automatically unlock gpg keys at session login')
#checkdepends=('bash-bats')

options=('zipman')

changelog=changelog.txt
install=wizard.install
source=("$pkgname.tar.gz::$url/archive/v$pkgver.tar.gz"
        'migrationhelper')
sha256sums=('12be55296d4e6ada7acdc75b26d5b64bdfb15ed984b47bbee5be9633781f57bf'
            '96471dc5a53af342cf14f5ec119df81509617f960c707d732781a24d9e2ed3c6')


#check() {
#  cd "$pkgname-$pkgver"
#  ./dotests
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" -s install
  install -m755 ../migrationhelper -t"$pkgdir/usr/share/$pkgname/"
  install -Dm644 README.rst -t"$pkgdir/usr/share/doc/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
