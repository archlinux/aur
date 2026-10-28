# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>
# Contributor: Martin <martin@abstractionsofreality.net>

pkgname=lastpass-cli
pkgver=1.6.2
pkgrel=2
pkgdesc="LastPass command line interface tool"
arch=('x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake' 'bash-completion')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b65b9c951a9a17b87b8ac0500808c716ef8e5fe6e70f1fd44f23b8385aa30984')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-doc
  install -Dm0644 contrib/lpass_zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_lpass
  install -Dm0644 contrib/completions-lpass.fish "$pkgdir"/usr/share/fish/vendor_completions.d/lpass.fish
}

# vim:set ts=2 sw=2 et:
