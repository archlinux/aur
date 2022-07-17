# Maintainer: Joan Figueras <ffigue at gmail dot com>

pkgname=linux-xanmod-edge-linux-headers-bin-x64v2
_major=5.18
pkgver=${_major}.11
_git=20220713.df1e87b
xanmod=1
pkgrel=${xanmod}
pkgdesc='Headers and scripts for building modules for the Linux Xanmod - Latest Mainline (EDGE) - Prebuilt version'
url="http://www.xanmod.org/"
arch=(x86_64)

license=(GPL2)
options=('!strip')
depends=(pahole)

source=("https://github.com/xanmod/linux/releases/download/${pkgver}-xanmod${xanmod}/linux-headers-${pkgver}-xanmod${xanmod}-x64v2_${pkgver}-xanmod${xanmod}-x64v2-0.git${_git}_amd64.deb")
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
)

sha256sums=('ffde7ce540b66b52bf3cd021bad604c4f06318313720f92472ebaf94050f977e')

prepare() {
  bsdtar -xf data.tar.xz
}

package() {

  local kernver="${pkgver}-xanmod${xanmod}-x64v2"
  local modulesdir="$pkgdir/usr/lib/modules/${kernver}"
  mkdir -p "${modulesdir}"
  cp -r lib/modules/${kernver}/* ${modulesdir}
  cp -r usr/* ${pkgdir}/usr
}

# vim:set ts=8 sts=2 sw=2 et:
