# Maintainer:  twa022 <twa022 at gmil dot com>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Cedric Leporcq <cedric at gmail dot com>

pkgname=xfce4-windowck-plugin
epoch=1
pkgver=0.4.5+38+g16d4a27
pkgrel=1
pkgdesc="Xfce panel plugin for displaying window title and buttons"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/panel-plugins/xfce4-windowck-plugin/"
license=('GPL3')
depends=('xfce4-panel>=4.14.0' 'libwnck3')
makedepends=('intltool' 'xfce4-dev-tools' 'python' 'imagemagick' 'git')
options=('!libtool')
_commit='16d4a27a9e740058ddd6e7dc72e49b1e81504aa4'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}-::;s:^v::;s/-/+/g"
}

build() {
  cd "$srcdir/${pkgname}"
  ./autogen.sh --prefix=/usr 
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make DESTDIR="$pkgdir" install
}
