# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: VargArch <roels.jorick@gmail.com>
# Contributor: zsrkmyn
# Contributor: marsam
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ctags-git
pkgver=5.9.20220417.0.r9.gb35f157c4
pkgrel=1
pkgdesc='Generates an index (or tag) file of language objects found in source files'
arch=('x86_64')
url=https://ctags.io
license=('GPL')
depends=('jansson' 'libseccomp' 'libxml2' 'libyaml')
makedepends=('git' 'python-docutils')
provides=('ctags')
conflicts=('ctags')
source=("git+https://github.com/universal-ctags/ctags.git")
b2sums=('SKIP')

pkgver() {
  cd ctags
  git describe --long --tags | sed 's/^p//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ctags
  ./autogen.sh
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc
  make
}

check() {
  make -C ctags check
}

package() {
  make -C ctags DESTDIR="$pkgdir" install
}
