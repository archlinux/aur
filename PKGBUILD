# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: sekret
# Contributor: Army
# Contributor: Funkmuscle

pkgname=guitarix-git
pkgver=0.35.2.r33.ga11713b7
pkgrel=1
pkgdesc="A virtual guitar amplifier for Linux"
arch=('i686' 'x86_64')
url="http://guitarix.sourceforge.net"
license=('GPL')
depends=('gtkmm' 'liblrdf' 'lilv' 'bluez-libs' 'boost-libs' 'webkitgtk2' 'zita-convolver' 'zita-resampler')
makedepends=('python' 'python2' 'boost' 'eigen' 'gperf' 'intltool' 'lv2')
optdepends=('meterbridge: sound meters')
provides=("${pkgname%-*}" "guitarix2" "gx_head")
conflicts=("${pkgname%-*}" "guitarix2" "gx_head")
source=("${pkgname%-*}::git+https://git.code.sf.net/p/guitarix/git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}/trunk"
  python2 waf configure --prefix=/usr \
                        --includeresampler \
                        --convolver-ffmpeg \
                        --no-desktop-update \
                        --no-ldconfig \
                        --no-faust \
                        --optimization \
                        --lib-dev	\
                        --install-roboto-font
  python2 waf build
}

package() {
  cd "${pkgname%-*}/trunk"
  python2 waf install --destdir="$pkgdir"
}

