# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=1.3.0
pkgrel=2
pkgdesc="LastPass command line interface tool"
arch=('x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake' 'bash-completion')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "globalsign-pins.patch")
sha256sums=('bbcfd673d668287e773eef44da65fbd2f292daa213a39528f31037c528dbcfe4'
            'ec91763f548a53ee7bfac4c3d36fe6516baacde50a493d5748816caace3ef58e')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 -i "$srcdir"/globalsign-pins.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-doc
  install -Dm0644 contrib/lpass_zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_lpass
}

# vim:set ts=2 sw=2 et:
