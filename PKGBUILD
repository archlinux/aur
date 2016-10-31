pkgname=hardened-fox
pkgver=r383.30107c0
pkgrel=1
pkgdesc='Firefox configuration to harden privacy.'
arch=('any')
url='https://github.com/pyllyukko/user.js'
license=('MIT')
depends=('firefox')
source=('user.js.git::git+https://github.com/pyllyukko/user.js.git'
        'local-settings.js')
sha512sums=('SKIP'
            '3cd84d8aecc69634cc06b7a5368ee027114cc254afdf4596dbe99d93c7ee7c497bb5f7ca528c56d129241c6adacaba9d9a62ee45631c482bd54007789a9e73b2')

pkgver() {
    cd "$srcdir/user.js.git"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/user.js.git"
    sed -i -e '1s#^#//\n#' -e 's/user_pref/lockPref/g' user.js
}

package() {
    install -Dm644 "$srcdir/local-settings.js" "$pkgdir/usr/lib/firefox/defaults/pref/local-settings.js"
    install -Dm644 "$srcdir/user.js.git/user.js" "$pkgdir/usr/lib/firefox/mozilla.cfg"
}
