_srcname=kmsvnc
pkgname=${_srcname}-git
pkgver=0.0.4.0.ga7de7db
pkgrel=1
pkgdesc="A VNC server for DRM/KMS capable GNU/Linux devices"
arch=('x86_64')
url='https://github.com/isjerryxiao/kmsvnc'
license=('GPL3')
depends=('libvncserver' 'libxkbcommon' 'libdrm' 'libva')
makedepends=('git' 'cmake')
provides=("$_srcname")
conflicts=("$_srcname")

source=("${_srcname}::git+${url}.git#branch=master")

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_srcname"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

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
