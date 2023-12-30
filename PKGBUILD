# Maintainer: Nullptrderef <echo "$(LC_ALL=C pacman -V|sed -r 's#[0-9]+#128#g'|tr -d '\r\n '|md5sum|openssl "md5" -hmac "mbmm" -binary|cut -c10-12|tr -d '\n';printf "la";echo "2" | openssl "sha512" -hmac "78k7" -binary|cut -c31-33|tr -d '\n';echo -n "eref@cock.li")" | sed 's/\n//g'>
#                           ^ Obfuscation method inspired by the AUR registration CAPTCHA; run in a shell after verifying the code's fine. Alternatively, contact me on matrix: @nullptrderef:piratenpartei.ch

# Configuration
_reposerver=github.com
_reponame=pixelflut
_repoauthor=defnull
_repo=https://$_reposerver/$_repoauthor/$_reponame
_pkgname=pixelnuke
_pkgbranch=master
_pkgsubdir=$_pkgname
_setprovides=true # if we should set the provides variable to the pkgname; for -git variant
_sourcedir="${_repoauthor}_${_reponame}_${_pkgbranch}"

# Package Build Info
pkgname="$_pkgname-git"
pkgver=r54.bf5217b
pkgrel=2
epoch=
pkgdesc="The C implementation of Pixelflut"
arch=('x86_64')
url="$_repo"
license=('unknown')
depends=(
  git
  base
  glew
  glfw
  libevent
  libdecor
  glibc
  glib2
)
makedepends=(
  base-devel
  make
  gcc
)
provides=()
conflicts=()
if $_setprovides; then
  provides+=("$_pkgname")
  conflicts+=($_pkgname)
fi
source=(
  "$_sourcedir::git+$_repo#branch=master"
)
sha512sums=('SKIP')

# Package Lifecycle Functions
pkgver() {
  cd "$_sourcedir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_sourcedir/$_pkgsubdir"
	make
}

package() {
	cd "$_sourcedir/$_pkgsubdir"
	install -Dm755 pixelnuke "$pkgdir/usr/bin/pixelnuke"
}
