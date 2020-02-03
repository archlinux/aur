# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


_pkgname=ice
pkgname=ice-ssb-git

pkgver() {
  git -C "$_pkgname" describe --tags | sed 's/v\?\([^-]\+\)-/\1.r/;s/-g/./'
}
pkgver=6.0.8.r3.961cd57
pkgrel=1

pkgdesc='Desktop integration for webapps'
url="https://github.com/peppermintos/$_pkgname"
arch=('any')
license=('GPL2')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=('git')
depends=('python-requests' 'python-beautifulsoup4' 'python-gobject' 'python-lxml')
optdepends=('brave' 'firefox' 'chromium' 'google-chrome' 'vivaldi')

source=("git+$url.git" "$_pkgname.patch")
sha256sums=('SKIP'
            '8aaff26c46a803ea6fb3a9e442a6fed830ff5c70228939783ceaa33578af5732')


prepare() {
    cd "$_pkgname"
    # patch browser binary filenames to match Archlinux packages
    patch -Np1 <"../$_pkgname.patch"
    # delete PeppermintOS specific assets
    rm -r usr/lib
}

package() {
    cd "$_pkgname"
    cp -a --no-preserve=ownership usr "$pkgdir/"
    install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_pkgname/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
