# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-media-tags-plugin
pkgname=${_pkgname}-git
pkgver=0.3.0+106+g8a66300
pkgrel=1
pkgdesc="Adds special features for media files to the Thunar File Manager (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-media-tags-plugin"
groups=('xfce4-goodies')
depends=('taglib' 'thunar>=1.7.0')
makedepends=('intltool' 'xfce4-dev-tools' 'git')
provides=("${_pkgname}=${pkgver%\.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
