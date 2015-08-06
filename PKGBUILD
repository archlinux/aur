# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributer: Chris <alostengineer at narmos dot org>
pkgname=pam_ssh_agent_auth
pkgver=0.10.2
pkgrel=1
pkgdesc="PAM module which permits authentication for arbitrary services via ssh-agent."
arch=('i686' 'x86_64')
url="http://pamsshagentauth.sourceforge.net/"
license=('custom:OpenSSL')
source=(http://downloads.sourceforge.net/project/pamsshagentauth/$pkgname/v$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('a212baca7ce11d596bd8dcb222859ace')

optdepends=('openssh: standard ssh-agent'
            'gnupg: gpg ssh-agent' )

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-mantype=man --libexecdir=/usr/lib/security
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.OpenSSL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
