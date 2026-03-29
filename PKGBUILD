# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=fastcompmgr
pkgname=$_reponame-dev
pkgver=0.5.r19.ga0f1368
pkgrel=2
pkgdesc="An early Compton-based compositor for X11 focused on performance. (dev branch)"
arch=('x86_64')
url="https://github.com/tycho-kirchner/$_reponame"
license=('MIT')
makedepends=('git')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("git+${url}.git#branch=dev")
b2sums=('SKIP')
provides=("$_reponame")
conflicts=("$_reponame")

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

  install -Dm755 "$_reponame" -t "$pkgdir/usr/bin"
  install -Dm644 "$_reponame.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
