# Maintainer: Franco Corbelli <franco at francocorbelli dot com>
# Contributor: Lone_Wolf  (bbs.archlinux.org)
# Contributor: Scimmia (bbs.archlinux.org)
# Contributor: Loqs (bbs.archlinux.org) 
pkgname=zpaqfranz-git
pkgver=git
pkgrel=2
pkgdesc="Swiss army knife for backup and disaster recovery, like 7z or RAR on steroids, with deduplicated 'snapshots' (versions). Conceptually similar to the Mac time machine, but much more efficiently. zpaq 7.15 fork"
arch=('i686' 'x86_64')
url="https://github.com/fcorbelli/zpaqfranz"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'grep' 'awk' 'sed')
conflicts=('zpaqfranz')
source=("git+https://github.com/fcorbelli/zpaqfranz.git")
sha256sums=('SKIP')
pkgver() 
{
  cd "zpaqfranz"
  _tag=$(grep "#define ZPAQ_VERSION" zpaqfranz.cpp |awk '{gsub(/"/, "", $3); print $3}' | sed 's/[^0-9]//g')
  printf "%s" "$_tag"
}
build() 
{
  cd "zpaqfranz"
  c++ $CXXFLAGS $CPPFLAGS $LDFLAGS -Dunix zpaqfranz.cpp -o zpaqfranz -pthread 
}
package() {
  cd "zpaqfranz"
  install -Dm 755 zpaqfranz "$pkgdir/usr/bin/zpaqfranz"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
