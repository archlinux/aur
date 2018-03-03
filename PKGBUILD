# Maintainer: JP Cimalando <jp-dev@inbox.ru>
pkgname=deken-git
_pkgname=deken
pkgver=v0.2.6.r125.gcb599c6
pkgrel=2
epoch=
pkgdesc="Externals wrangler for Pure Data"
arch=('any')
url="https://puredata.info/docs/Deken"
license=('custom:BSD')
groups=()
depends=('hy' 'python-easywebdav' 'python-pyelftools' 'python-macholib'
         'python-pefile' 'python-gnupg' 'python-keyring'
         'python-ndg-httpsclient' 'python-pyasn1' 'python-pyopenssl')
makedepends=()
checkdepends=()
optdepends=()
provides=('deken')
conflicts=('deken')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/pure-data/$_pkgname"
        'hy-0.14.diff')
md5sums=('SKIP'
         '9f6911515de9a79f81a0f385aed1f772')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir"/hy-0.14.diff
}

package() {
  cd "$_pkgname"
  install -D -m755 "developer/deken.hy" "$pkgdir/usr/bin/deken"
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
