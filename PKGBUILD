# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=mosh-sshagent-git
pkgver=20170108
pkgrel=1
pkgdesc="Mobile shell with support for ssh-agent-forwarding and out-of-band"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty' 'libutempter')
makedepends=('git' 'automake' 'autoconf')
optdepends=('perl-io-socket-ip: for IPv6 support')
conflicts=('mosh' 'mosh-git')
source=('git+https://github.com/rinne/mosh.git#branch=agent-forwarding-merge-20151128')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mosh"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/mosh"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/mosh"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "conf/bash-completion/completions/mosh" \
    "$pkgdir/usr/share/bash-completion/completions/mosh"
}
