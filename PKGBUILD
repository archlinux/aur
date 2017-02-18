# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=dpf-plugins-git
pkgver=r73.fe9e89e
pkgrel=1
pkgdesc="Collection of DPF-based plugins by DISTRHO. LV2, LADSPA, dssi and VST."
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'LGPL' 'MIT' 'custom:ISC')
depends=('liblo' 'projectm')
makedepends=('git' 'wget')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/DISTRHO/DPF-Plugins"
        "LICENSE_KARS_ISC" 
        "LICENSE_NDC_MIT")
md5sums=('SKIP'
         '7b4d7947003bd60e5475fc61c6d014da'
         '89d28c0ce6f25d8f0c3c4b1d5b4f0da3')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    # Install the custom licenses:
    install -Dm 644 "LICENSE_NDC_MIT" "$pkgdir/usr/share/licenses/$pkgname/AmplitudeImposer/LICENSE"
    install -Dm 644 "LICENSE_NDC_MIT" "$pkgdir/usr/share/licenses/$pkgname/CycleShifter/LICENSE"
    install -Dm 644 "LICENSE_NDC_MIT" "$pkgdir/usr/share/licenses/$pkgname/SoulForce/LICENSE"
    install -Dm 644 "LICENSE_KARS_ISC" "$pkgdir/usr/share/licenses/$pkgname/Kars/LICENSE"
    # Install the package files:
    cd "${pkgname%-*}"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
