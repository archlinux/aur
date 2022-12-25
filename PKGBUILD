# Maintainer: sardo <sardonimous@hotmail.com>
pkgname=oorexx-beta
pkgver=5.1.0.r12587
pkgrel=1
pkgdesc="open source implementation of Object Rexx"
arch=('x86_64')
url="http://www.oorexx.org/"
license=('CPL')
depends=('bash' 'gcc-libs-multilib')
makedepends=('subversion' 'cmake')
optdepends=('tcsh: for C shell sample'
	    'sh: for sh shell sample')
provides=("rexx")
conflicts=("oorexx")
source=("${pkgname}::svn+svn://svn.code.sf.net/p/oorexx/code-0/main/trunk/")
sha256sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "5.1.0.r%s" "${ver//[[:alpha:]]}"
}
prepare() {
  cd "${pkgname}"
  if [ ! -d ../build ]; then mkdir ../build; fi
}
build() {
  cd "${pkgname}"
  cd ../build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE "../${pkgname}"
  make || return 1
}
package() {
  cd "${pkgname}"
  cd ../build
  make DESTDIR="${pkgdir}" install || return 1
}
