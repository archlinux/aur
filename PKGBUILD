# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


_name=ice
pkgname=ice-ssb-git

pkgver() {
  git -C "$_name" describe --tags | sed 's/v\?\([^-]\+\)-/\1.r/;s/-g/./'
}
pkgver=6.0.8.r30.5ddfc8e
pkgrel=1

pkgdesc='Desktop integration for webapps'
url="https://github.com/peppermintos/$_name"
arch=('any')
license=('GPL2')

provides=("${pkgname%-git}" "$_name")
conflicts=("${pkgname%-git}" "$_name")

makedepends=('git')
depends=('python-requests' 'python-beautifulsoup4' 'python-gobject' 'python-lxml')
optdepends=('brave' 'firefox' 'chromium' 'google-chrome' 'vivaldi')

source=("git+$url.git" "$_name.patch")
sha256sums=('SKIP'
            '1b3ba9c290faa8a9f2c8caf6c754378ac7ae82cf1117318a115e075b800c10d3')


prepare() {
    cd "$_name"
    # patch browser binary filenames to match Archlinux packages
    patch --verbose -Np1 <"../$_name.patch"
    # delete PeppermintOS specific assets
    rm -r usr/lib
}

package() {
    cd "$_name"
    cp -a --no-preserve=o usr "$pkgdir/"
    install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
