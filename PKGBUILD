# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-archive-plugin
pkgname=${_pkgname}-git
pkgver=0.4.0.r2.g3d98109
pkgrel=1
pkgdesc="Create and extract archives in Thunar (git checkout)"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('thunar>=1.7.0' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools' 'git')
optdepends=('file-roller'
            'ark'
            'xarchiver'
            'engrampa')
provides=("${_pkgname}=${pkgver%\.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://git.xfce.org/thunar-plugins/thunar-archive-plugin")
sha256sums=('SKIP')
            
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
