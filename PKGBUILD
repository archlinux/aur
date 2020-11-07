# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


_pkgname=ice
pkgname=ice-ssb-git

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/v\?\([^-]\+\)-/\1.r/;s/-g/./'
}
pkgver=6.0.8.r26.499b891
pkgrel=2

pkgdesc='Desktop integration for webapps'
url="https://github.com/peppermintos/$_pkgname"
arch=('any')
license=('GPL2')

provides=("${pkgname%-git}" "$_pkgname")
conflicts=("${pkgname%-git}" "$_pkgname")

makedepends=('git')
depends=('python-requests' 'python-beautifulsoup4' 'python-gobject' 'python-lxml')
optdepends=('brave' 'firefox' 'chromium' 'google-chrome' 'vivaldi')

source=("git+$url.git" "$_pkgname.patch")
sha256sums=('SKIP'
            'b7ca85f38fb7dd9369d069ab1969d082fda6f23f16218fe13c3b69c9f886f8b6')


prepare() {
    cd "$_pkgname"
    # patch browser binary filenames to match Archlinux packages
    patch --no-backup-if-mismatch -Np1 <"../$_pkgname.patch"
    # delete PeppermintOS specific assets
    rm -r usr/lib
}

package() {
    cd "$_pkgname"
    cp -a --no-preserve=o usr "$pkgdir/"
    install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_pkgname/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
