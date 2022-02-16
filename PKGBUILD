# Adapted for git by xavery <dkk089@gmail.com>, based on original PKGBUILD by :
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-cpufreq-plugin-git
_gitname=xfce4-cpufreq-plugin
pkgver=1.2.1.r7.ga6a515f
pkgrel=1
epoch=1
pkgdesc="CPU frequency plugin for the Xfce4 panel (git checkout)"
arch=('x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel-git' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'xfce4-dev-tools')
provides=('xfce4-cpufreq-plugin')
conflicts=('xfce4-cpufreq-plugin')
options=('!libtool')
source=("${_gitname}::git+https://gitlab.xfce.org/panel-plugins/xfce4-cpufreq-plugin")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long | sed 's/^xfce4.cpufreq.plugin-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_gitname}
  mkdir m4
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
  --sysconfdir=/etc \
  --libexecdir=/usr/lib \
  --localstatedir=/var \
  --disable-static \
  --disable-debug
  make
}

package() {
  cd ${_gitname}
  make DESTDIR=${pkgdir} install
}
