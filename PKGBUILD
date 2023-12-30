# Maintainer: Nullptrderef <echo "$(LC_ALL=C pacman -V|sed -r 's#[0-9]+#128#g'|tr -d '\r\n '|md5sum|openssl "md5" -hmac "mbmm" -binary|cut -c10-12|tr -d '\n';printf "la";echo "2" | openssl "sha512" -hmac "78k7" -binary|cut -c31-33|tr -d '\n';echo -n "eref@cock.li")" | sed 's/\n//g'>
#                           ^ Inspired by the AUR registration CAPTCHA; run in a shell after verifying the code's fine.

# Configuration
_reposerver=github.com
_reponame=pixelflut
_repoauthor=defnull
_repo=https://$_reposerver/$_repoauthor/$_reponame
_pkgname=pixelnuke
_pkgsubdir=$_pkgname
_setprovides=true # if we should set the provides variable to the pkgname; for -git variants

# Generated Config
_pkgdate="20234330_0143_03"
_pkgcommit="bf5217b"
_commitcount="55";

# The directory the source outputs to
_builddir="$_reponame-$_pkgcommit/$_pkgsubdir"

# Package Build Info
pkgname="$_pkgname-git"
pkgver="r${_commitcount}.${_pkgcommit}"
pkgrel="1"
epoch=
pkgdesc="The C implementation of Pixelflut"
arch=('x86_64')
url="$_repo"
license=('unknown')
depends=(
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
  provides+=($pkgname)
  conflicts+=($pkgname)
fi
source=("https://codeload.github.com/$_repoauthor/$_reponame/zip/$_pkgcommit")
sha512sums=('00b21531791f772b121ab3d803ea5402b2f735fb996348753ad340085ef0a60435e2227ea9c6972c6e5bfb877d626d54690efd4340363d4d59daa7f8a8c2224a')

# Package Build Functions
build() {
	cd "$_builddir"
	make
}

package() {
	cd "$_builddir"
	install -Dm755 pixelnuke "$pkgdir/usr/bin/pixelnuke"
}
