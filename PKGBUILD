# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.3.12
pkgrel=1
arch=("x86_64")
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=("GPL")
makedepends=("git")
depends=("libgl")
optdepends=("natron-plugins")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-misc#tag=Natron-$pkgver"
        "git+https://github.com/NatronGitHub/openfx"
        "git+https://github.com/NatronGitHub/openfx-supportext")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       BITS=64
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=64
}
