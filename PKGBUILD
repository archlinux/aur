# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=cbftp-svn
pkgver=r1183
pkgrel=1
pkgdesc='an advanced multi-purpose FTP/FXP client that focuses on efficient large-scale data spreading, while also supporting most regular FTP/FXP use cases in a modern way. It runs in a terminal and provides a semi-graphical user interface through ncurses.'
arch=('x86_64')
url='https://cbftp.eu'
depends=('openssl' 'ncurses')
makedepends=('subversion' 'gcc')
optdepends=()
provides=('cbftp' 'cbftp-svn')
conflicts=('cbftp')
replaces=('cbftp')
license=('MIT')
_srcname=cbftp
source=("svn+https://cbftp.eu/svn/cbftp/" "disable-debian.patch")
sha256sums=('SKIP'
	'77bbedb52617cc34edc49e6d93075c092b333fdb17c4b554f431e7057a90fcd8')

pkgver() {
  cd "$_srcname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$_srcname"
  make
}

prepare() {
  cd "$_srcname"
  patch -Np0 -i "${srcdir}/disable-debian.patch"
}

package() {
  cd "$_srcname"
  install -D -m775 bin/* -t "${pkgdir}/usr/bin"
}
