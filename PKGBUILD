# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>
pkgname=kupfer
pkgver=302
pkgrel=1
pkgdesc="Launcher application written in python. Similar to Gnome-Do / Launchy"
arch=('i686' 'x86_64')
url="https://kupferlauncher.github.io"
license=('GPL3')
depends=('libkeybinder3' 'python-dbus' 'python' 'python-cairo' 'libwnck3')
makedepends=('intltool')
install=${pkgname}.install
source=("https://github.com/kupferlauncher/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.xz")
sha1sums=('5cbd6648e83b4b6797930a7bdaca8e83947b8b8a')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  # fix man page generation
  sed -i 's_rst2man_&2_Ig' wscript

  export PYTHON="/usr/bin/python"
  ./waf configure --prefix=/usr \
                  --no-update-mime \
                  --no-update-icon-cache
  ./waf
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./waf install -f --destdir="${pkgdir}"
}




