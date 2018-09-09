# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=dpf-plugins-git
pkgver=r88.d3f1a4c
pkgrel=2
pkgdesc="Collection of DPF-based plugins by DISTRHO. LV2, LADSPA, dssi and VST."
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('custom')
depends=('liblo' 'projectm')
makedepends=('git' 'wget')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}"::'git+https://github.com/DISTRHO/DPF-Plugins.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make BUILD_DSSI=true BUILD_LV2=true BUILD_VST=true BUILD_JACK=true
}

package() {
    cd "${pkgname%-*}"
    # Install the custom license:
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Install the package files:
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
