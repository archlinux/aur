# Maintainer      : Yuu $(echo \<yuu-tutamail+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author : Cem Keylan <https://github.com/cemkeylan>

pkgname=mu-wizard-git
pkgver=0.r4.g97b6519
pkgrel=1
pkgdesc="Shell script to easily setup mu4e on Emacs"
arch=('any')
url=https://github.com/cemkeylan/mu-wizard
license=('GPL3')
depends=('isync' 'msmtp' 'mu' 'pass')
makedepends=('git')
optdepends=('pash: alternative password manager'
            'pm: alternative password  manager')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+$url")
md5sums=('SKIP')

# Git, no tags available.
# Use number of revisions since beginning of the history.
pkgver() {
    cd "${pkgname%-git}"
    printf '0.r%s.g%s' \
           "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
