# Maintainer: awe00 < awe00 AT hotmail DOT fr>
# Contributor: Ondřej Hlavatý <ohlavaty at redhat dot com>
pkgname=plotnetcfg-git
pkgver=v0.4.1.r65.gbb4e154
pkgrel=1
pkgdesc="A tool that scans networking configuration on the machine and plots a diagram of the configuration hierarchy"
arch=('i686' 'x86_64')
url="https://github.com/jbenc/plotnetcfg"
license=('GPL2')
depends=('jansson>=2.3')
makedepends=('git')
provides=('plotnetcfg')
conflicts=('plotnetcfg')
source=("git+https://github.com/jbenc/plotnetcfg" "plotnetcfg-git.patch")
md5sums=('SKIP' '54a548645f6d46633e5c3b19a608de36')
_gitrepo=plotnetcfg

pkgver() {
  cd "$_gitrepo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitrepo"
	patch -p1 <../plotnetcfg-git.patch
}

build() {
  cd "$_gitrepo"
  make CC=gcc
}

package() {
  cd "$_gitrepo"
  make DESTDIR="$pkgdir/" install
}
