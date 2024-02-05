_srcname=kmsvnc
pkgname=${_srcname}
pkgver=0.0.6
pkgrel=1
pkgdesc="A VNC server for DRM/KMS capable GNU/Linux devices"
arch=('x86_64')
url='https://github.com/isjerryxiao/kmsvnc'
license=('GPL-3.0-or-later')
depends=('libvncserver' 'libxkbcommon' 'libdrm' 'libva')
makedepends=('git' 'cmake')

source=("${_srcname}::git+${url}.git#tag=v$pkgver")

sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${_srcname}"
    mkdir -p build
}

build() {
    cd "$srcdir/${_srcname}"
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make    
}

package() {
  cd "$srcdir/${_srcname}"
  cd build
  make DESTDIR="$pkgdir/" install
}
