# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

_pkgname=xfce4-windowck-plugin
pkgname=${_pkgname}-git
epoch=1
pkgver=0.4.5+156+g448ce38
pkgrel=1
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin/"
license=('GPL3')
depends=('xfce4-panel' 'libwnck3')
makedepends=('intltool' 'xfce4-dev-tools' 'python' 'git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("${_pkgname}::git+${url}")
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
