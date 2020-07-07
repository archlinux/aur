# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=1.3.3
pkgrel=2
pkgdesc="LastPass command line interface tool"
arch=('x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake' 'bash-completion')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f38e1ee7e06e660433a575a23b061c2f66ec666d746e988716b2c88de59aed73')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-doc
  install -Dm0644 contrib/lpass_zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_lpass
  install -Dm0644 contrib/completions-lpass.fish "$pkgdir"/usr/share/fish/vendor_completions.d/lpass.fish
}

# vim:set ts=2 sw=2 et:
