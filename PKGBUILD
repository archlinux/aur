# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_reponame=fastcompmgr
pkgname=$reponame-git
pkgver=0.5.r20.ga449edb
pkgrel=1
pkgdesc="An early Compton-based compositor for X11 focused on performance. (git)"
arch=('x86_64')
url="https://github.com/tycho-kirchner/$reponame"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
makedepends=('git')
provides=("$reponame")
conflicts=("$reponame")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$reponame"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "$reponame"
  make
}

package() {
  cd "$reponame"

  install -Dm755 "$reponame" -t "$pkgdir/usr/bin"
  install -Dm644 "$reponame.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
