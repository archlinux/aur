# Maintainer: doonoo <your-email@example.com>
#
# AUR package that builds the latest commit of Strait Bible ("-git" package).
# Not tested on Arch yet: build it in a clean chroot (see packaging/README.md) before uploading it to the AUR.

pkgname=straitbible-git
_pkgname=straitbible
pkgver=6.2.r0.g0000000
pkgrel=1
pkgdesc='Free multilingual Bible reader (based on Unbound Bible)'
arch=('x86_64')
url='https://github.com/doonoo/straitbible'
license=('GPL3')
depends=('gtk2' 'sqlite' 'hicolor-icon-theme')
makedepends=('git' 'fpc' 'lazarus')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        'zeoslib::git+https://github.com/marsupilami79/zeoslib.git#branch=7.2.14-stable')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf '6.2.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  sh packaging/build-linux.sh "$srcdir/zeoslib"
}

package() {
  cd "$srcdir/$_pkgname"
  sh packaging/install-linux.sh "$pkgdir" /usr
}
