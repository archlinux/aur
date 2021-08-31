# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Roland Puntaier <roland [dot] puntaier [at] gmail [dot] com>


pkgname=mailwizard-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --long | sed 's/^v//;s/-/.r/;s/-/./'; }
pkgver=2.0.6.r0.g1a5962e
pkgrel=1

pkgdesc='Configure neomutt, isync, getmail and msmtp with pass for passwords (POP3/SMTP)'
arch=('x86_64')
url="https://github.com/rpuntaie/$_name"
license=('GPL3')

provides=("$_name")
conflicts=("$_name" 'mutt-wizard')

makedepends=('git')
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
source=("git+$url"
        'migrationhelper')
sha256sums=('SKIP'
            '96471dc5a53af342cf14f5ec119df81509617f960c707d732781a24d9e2ed3c6')


#check() {
#  cd "$_name"
#  ./dotests
#}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" -s install
  install -m755 ../migrationhelper -t"$pkgdir/usr/share/$_name/"
  install -Dm644 README.rst -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
