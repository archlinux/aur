# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: openfbt
# Contributor: Werecat
# Contributor: Xyne

_pkgname=cjdns
pkgname=$_pkgname-git
pkgver=0.3.3382
pkgrel=2
pkgdesc='A routing engine designed for security, scalability, speed and ease of use'
url='https://github.com/cjdelisle/cjdns'
license=('GPL3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
options=('!distcc' '!strip' '!buildflags')
depends=('glibc')
makedepends=('git' 'nodejs' 'python2')
optdepends=(
  'cjdnsify: allows you to run some programs bound to your cjdns address'
  'cjdns-git-sysvinit: support for sysvinit (rc.d)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url#branch=crashey")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's|-|.|g;s|[^\.]*\.||;s|\.[^\.]*$||'
}

build() {
  cd $_pkgname
  bash 'do'
}

package() {
  cd $_pkgname
  install -Dm755 cjdroute "$pkgdir/usr/bin/cjdroute"
  install -Dm755 contrib/sh/run-cjdroute.sh "$pkgdir/usr/bin/run-cjdroute"
  install -Dm644 contrib/systemd/$_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 doc/man/cjdroute.conf.5 "$pkgdir/usr/share/man/man5/cjdroute.conf.5"
}
