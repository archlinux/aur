# Maintainer      : Yuu $(echo \<yuu-tutamail+com\>|sed s/\+/./g\;s/\-/@/)
# Upstream author : Cem Keylan <https://github.com/cemkeylan>

_pkgname="mu-wizard"
pkgname="${_pkgname}-git"
pkgver=0.r47.g8f54347
pkgrel=3
pkgdesc="Shell script to easily setup mu4e on Emacs"
arch=('any')
url=https://github.com/cemkeylan/${_pkgname}
license=('GPL3')
depends=('isync' 'msmtp' 'mu' 'pass' 'sh')
makedepends=('git')
optdepends=('pash: alternative password manager'
            'pm: alternative password  manager')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

# Git, no tags available.
# Use number of revisions since beginning of the history.
pkgver() {
    cd "${_pkgname}"
    printf '0.r%s.g%s' \
           "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 README.org -t "$pkgdir/usr/share/doc/${_pkgname}/"
}
