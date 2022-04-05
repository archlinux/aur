pkgname=libsciter-gtk-git-bin
pkgver=4.4.8.23.g0298f1b
pkgrel=1
pkgdesc='Sciter SDK library for GTK3 (git version)'
arch=(x86_64)
url='https://sciter.com'
license=(custom)
depends=(gtk3)
makedepends=(jq)
provides=(libsciter-gtk)
conflicts=(libsciter-gtk libsciter-gtk-bin)
source=('https://github.com/c-smile/sciter-sdk/raw/master/bin.lnx/x64/libsciter-gtk.so'
        'LICENSE.html::https://github.com/c-smile/sciter-sdk/raw/master/license.htm')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    _commit_info=$(curl "https://github.com/c-smile/sciter-sdk/commits/master/bin.lnx/x64/libsciter-gtk.so" | grep -oE -m1 'href="/c-smile/sciter-sdk/commit/(.+)">(([0-9]+\.){3}[0-9]+)</a>')
    _version=$(printf $_commit_info | grep -oE '([0-9]+\.){3}[0-9]+')
    _hash=$(printf $_commit_info | grep -oE '[0-9a-f]{32}' | head -c7)
    printf ${_version}.g${_hash}
}

package() {
    install -Dm755 "$srcdir/libsciter-gtk.so" "$pkgdir/usr/lib"
    install -Dm644 "$srcdir/LICENSE.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
