# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contrubitor: Juston Li <juston.h.li@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=repo
pkgname=repo-git
pkgver=1.13.2.r0.g13f323b2
pkgrel=1
pkgdesc="The Multiple Git Repository Tool"
arch=('any')
url="https://source.android.com/source/developing.html"
license=('Apache')
depends=('git' 'python2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gerrit.googlesource.com/git-repo"
        "python2.patch")
sha256sums=('SKIP'
            'bdb224e0e04060d6ec7e2fcc95bcf09ad46585e0ff65d914050192b60ce990d4')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  patch -Np1 -i "$srcdir"/python2.patch
}

package() {
  cd "$_pkgname"
  install -Dm755 repo "$pkgdir"/usr/bin/repo
  install -Dm644 docs/manifest-format.md "$pkgdir"/usr/share/doc/repo/manifest-format.md
}
