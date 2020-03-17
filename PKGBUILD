# Maintainer      :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author :  Roland Puntaier <roland [dot] puntaier [at] gmail [dot] com>
# Upstream author :  Luke Smith <luke [at] lukesmith [dot] xyz>


pkgname=mailwizard-git

pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r730.89f8ae6
pkgrel=1

pkgdesc='Configure neomutt, isync, getmail and msmtp with pass for passwords'
arch=('x86_64')
url="https://github.com/rpuntaie/${pkgname%-git}"
license=('GPL3')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'mutt-wizard')

makedepends=('git')
depends=('neomutt' 'isync' 'getmail' 'msmtp' 'notmuch-runtime' 'pass' 'urlscan')
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
            '34682620297727b9bf93670b84592050d59181e682d3867cd56aefedbd67243f')


#check() {
#  cd "${pkgname%-git}"
#  ./dotests
#}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" -s install
  install -m755 ../migrationhelper -t"$pkgdir/usr/share/${pkgname%-git}/"
  install -Dm644 README.rst -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
