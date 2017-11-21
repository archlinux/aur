# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=solbuild
pkgver=1.4.2
pkgrel=1
pkgdesc="The Solus package build system"
arch=(x86_64 i686)
url="https://solus-project.com/"
license=(Apache)
depends=(git libgit2 abireport)
makedepends=(go)
source=("https://github.com/solus-project/solbuild/releases/download/v$pkgver/solbuild-$pkgver.tar.gz"{,.asc}
        solbuild.conf)
sha512sums=('eb11a5fade205167e05050dcbd040344ee7c989cfcfa7fb216b2fd8432c9f795d83563092258df517d59840146a8cd15c6f445754bea20f1c584991b598342f9'
            'SKIP'
            'e3ab36dbb1a84e49f499e6c27cf3adb738961351799bd993ac339d2c22b3c753cf3ead8bde5e7a7ca2c5cc39028c20f024711f3fd68489c666ffb25c7eff323b')
validpgpkeys=('8876CC8EDAEC52CEAB7742E778E2387015C1205F') # Ikey Doherty

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -m 00644 data/99_unstable.conf "$pkgdir"/usr/share/solbuild/.
  install -m 00644 data/local-unstable-x86_64.profile "$pkgdir"/usr/share/solbuild/.
  install -D -m 00644 "$srcdir"/solbuild.conf "$pkgdir"/usr/lib/tmpfiles.d/solbuild.conf
}
