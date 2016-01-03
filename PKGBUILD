# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: sekret
# Contributor: Army
# Contributor: Funkmuscle

_pkgname=guitarix
pkgname=$_pkgname-git
pkgver=0.34.0.r76.g8d2a959
pkgrel=1
pkgdesc="a virtual guitar amplifier for Linux"
arch=('i686' 'x86_64')
url="http://guitarix.sourceforge.net"
license=('GPL')
depends=('gtkmm' 'liblrdf' 'boost-libs' 'zita-convolver' 'eigen' 'bluez-libs' 'lilv' 'ffmpeg' 'webkitgtk2')
makedepends=('git' 'python2' 'boost' 'intltool' 'lv2' 'gperf')
optdepends=('meterbridge: sound meters')
provides=("$_pkgname" 'guitarix2' 'gx_head')
conflicts=("$_pkgname" 'guitarix2' 'gx_head')
install=$pkgname.install
source=("$_pkgname::git+git://git.code.sf.net/p/guitarix/git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname/trunk"
  python2 waf configure --prefix=/usr \
                        --includeresampler \
                        --convolver-ffmpeg \
                        --no-desktop-update \
                        --no-ldconfig \
                        --no-faust \
                        --optimization \
                        --lib-dev
  python2 waf build
}

package() {
  cd "$_pkgname/trunk"
  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
