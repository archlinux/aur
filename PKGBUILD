# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=cbftp-svn
pkgver=r1244
pkgrel=2
pkgdesc='an advanced multi-purpose FTP/FXP client that focuses on efficient large-scale data spreading, while also supporting most regular FTP/FXP use cases in a modern way. It runs in a terminal and provides a semi-graphical user interface through ncurses.'
arch=('x86_64')
url='https://cbftp.glftpd.io'
depends=('openssl' 'ncurses')
makedepends=('subversion' 'gcc')
optdepends=()
provides=('cbftp' 'cbftp-svn')
conflicts=('cbftp')
replaces=('cbftp')
license=('MIT')
_srcname=cbftp
source=("svn+https://cbftp.glftpd.io/svn/cbftp/")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$_srcname"
  unset OPTFLAGS
  unset CXXFLAGS
  unset CFLAGS
  unset LINKFLAGS
  make -j
}

prepare() {
  cd "$_srcname"
}

package() {
  cd "$_srcname"
  install -D -m775 bin/* -t "${pkgdir}/usr/bin"
}
