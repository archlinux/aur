# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


_name=ice
pkgname=ice-ssb-git

pkgver() { git -C "$_name" describe --tags | sed 's/v\?\([^-]\+\)-/\1.r/;s/-g/./'; }
pkgver=6.0.8.r30.5ddfc8e
pkgrel=2

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
            'f5c36986ee2f96860108ae3537fdf9ebb41c4478aa13a9fe3578b18ebd518eb4')


prepare() {
  cd "$_name"
  patch --verbose -Np1 <"../$_name.patch"
  # delete PeppermintOS specific assets
  rm -r usr/lib
}

package() {
  cd "$_name"
  cp -a --no-preserve=o usr "$pkgdir/"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
