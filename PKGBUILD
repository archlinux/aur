# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=mosh-agent
_pkgname=mosh
pkgver=1.4.0
pkgrel=5
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing (with SSH agent forwarding support)'
arch=(x86_64)
url='https://mosh.org/'
license=(GPL3)
depends=(libutempter openssh openssl perl-io-tty protobuf)
makedepends=(git)
provides=(mosh)
conflicts=(mosh)
options=(!emptydirs)
source=("$pkgname::git+https://github.com/intelfx/mosh#branch=work/agent-$pkgver")
b2sums=('SKIP')

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --enable-ufw --enable-agent-forwarding --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname install
  install -Dm644 "$pkgname/conf/bash-completion/completions/$_pkgname" \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}

# getver: raw.githubusercontent.com/mobile-shell/mosh/master/ChangeLog
