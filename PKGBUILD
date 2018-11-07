# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

_pkgname=dispad
pkgname=$_pkgname-git
pkgver=r53.5b7528c
pkgrel=1
pkgdesc='A small (user) daemon for disabling trackpads on keyboard input for XOrg.'
license=('GPLv2')
url='https://github.com/BlueDragonX/dispad'
arch=('any')
depends=('confuse' 'libxi' 'xorg-server')
makedepends=('automake' 'git')
install=$_pkgname.install
source=("$pkgname"::"git://github.com/BlueDragonX/dispad.git"
        "$_pkgname.service"
        "$_pkgname.conf.example")
sha256sums=('SKIP'
            '85ab4a6596aa520663c8a28920f8d7a03455b2f5c3f4831b755440e0de13336f'
            '8c707e39a5a298a08babad2da4819dfa37d9895ef0131426e81f3608cfa77a88')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix="/usr"
  make -j$(nproc)
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "../$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
  install -Dm644 "../$_pkgname.conf.example" "$pkgdir/etc/dispad/$_pkgname.conf.example"
}

# vim: ts=2 sw=2 et:
