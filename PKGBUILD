# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

_reponame=fastcompmgr
pkgname=$_reponame-git
pkgver=0.6.1.r1.ge712f94
pkgrel=1
pkgdesc="An early Compton-based compositor for X11 focused on performance. (git)"
arch=('x86_64')
url="https://github.com/tycho-kirchner/$_reponame"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
makedepends=('git')
provides=("$_reponame")
conflicts=("$_reponame")
source=("git+${url}.git#branch=dev")
b2sums=('SKIP')

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
  cd "$_reponame"
  make -j$(nproc)
}

package() {
  cd "$_reponame"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
