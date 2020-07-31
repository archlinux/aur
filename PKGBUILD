# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

_pkgname=xfce4-windowck-plugin
pkgname=${_pkgname}-git
pkgver=0.4.5+27+g61f49d4
pkgrel=1
pkgdesc="Xfce panel plugin which allows to put the maximized window title and buttons on the panel."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/cedl38/xfce4-windowck-plugin"
license=('GPL3')
depends=('xfce4-panel>=4.14.0' 'libwnck3')
makedepends=('intltool' 'xfce4-dev-tools' 'python' 'imagemagick')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("${_pkgname}::git+https://github.com/qarkai/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}-::;s:^v::;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
