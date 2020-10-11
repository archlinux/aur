# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: VargArch <roels.jorick@gmail.com>
# Contributor: zsrkmyn
# Contributor: marsam

pkgname=universal-ctags
_pkgver=p5.9.20201011.0
pkgver="${_pkgver:1}"
pkgrel=1
pkgdesc='Generates an index (or tag) file of language objects found in source files'
arch=('x86_64')
url=https://ctags.io
license=('GPL')
depends=('jansson' 'libseccomp' 'libxml2' 'libyaml')
makedepends=('python-docutils')
provides=('ctags')
conflicts=('ctags')
source=("https://github.com/universal-ctags/ctags/archive/$_pkgver/ctags-$_pkgver.tar.gz")
b2sums=('136da9be347797fd3c5834ed0642aea8392dabd8d95d01446d61689ca41c2efe61cea1040e4fc1154bed398dd44d093d5bbde39f2c21de20f112c353d69d9c64')

build() {
  cd ctags-$_pkgver
  ./autogen.sh
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc
  make
}

check() {
  cd ctags-$_pkgver
  mkdir -p testhome
  export HOME=./testhome
  export XDG_CONFIG_HOME=
  make check
}

package() {
  cd ctags-$_pkgver
  make DESTDIR="$pkgdir" install
}
