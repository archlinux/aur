# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-archive-plugin
pkgname=${_pkgname}-git
pkgver=0.4.0+97+ge9a0d87
pkgrel=1
pkgdesc="Create and extract archives in Thunar (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
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
conflicts=("${_pkgname}" 'engrampa-thunar')
replaces=('engrampa-thunar')
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')
            
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
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
