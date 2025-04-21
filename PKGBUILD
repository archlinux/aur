# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Boris <arch at palatinux dot com>

pkgname=streamripper
epoch=1
_pkgver=1.64.6
pkgver=1.64.6+56+a5597af
pkgrel=2
pkgdesc="Records and splits streaming mp3 into tracks"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://streamripper.sourceforge.net"
license=('GPL')
depends=('glib2' 'libmad' 'faad2' 'libvorbis')
makedepends=('git')
_commit='a5597af77b942b97cacb207929043c9aac0b756e'
source=("git+https://github.com/Magentron/streamripper#commit=${_commit}"
        'fixheaderbufsize.patch')
sha256sums=('be6711fa28351a8f2165cff41b7afd253ccbf910cf342d253c53511a37966e60'
            '8f11597db7c59bea23c0f648483b5af4af3d652962290e63a24ce6e0e6712cba')

pkgver() {
  local _rel_commit='6e5f5fecd31f45eacf630443d91eea6f850dcab1'
  cd "${pkgname}"
  printf "%s+%s+%s" "${_pkgver}" "$(( `git rev-list --count ${_commit}` - `git rev-list --count ${_rel_commit}` ))" "`git rev-parse --short ${_commit}`"
}

prepare() {
  cd "${pkgname}"
  patch -Np1 -i ../fixheaderbufsize.patch
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
}
