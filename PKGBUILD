# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributor: Chris <alostengineer at narmos dot org>
pkgname=pam_ssh_agent_auth
pkgver=0.10.3
pkgrel=2
pkgdesc="PAM module which permits authentication for arbitrary services via ssh-agent."
arch=('i686' 'x86_64')
url="http://pamsshagentauth.sourceforge.net/"
license=('custom:OpenSSL')
source=(http://downloads.sourceforge.net/project/pamsshagentauth/$pkgname/v$pkgver/$pkgname-$pkgver.tar.bz2)
# I couldn't find a published checksum upstream, but Debian uses this md5sum:
md5sums=('8dbe90ab3625e545036333e6f51ccf1d')
depends=('openssl-1.0')
optdepends=('openssh: standard ssh-agent'
            'gnupg: gpg ssh-agent' )

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
  CFLAGS+=" -I/usr/include/openssl-1.0" \
  LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
  ./configure --prefix=/usr --with-mantype=man --libexecdir=/usr/lib/security
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.OpenSSL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
