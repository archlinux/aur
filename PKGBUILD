# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: Dicebot <public@dicebot.lv>

pkgname=dlang-digger
pkgver=3.0.6
pkgrel=2
pkgdesc='A tool to build D and bisect old D versions'
arch=('i686' 'x86_64')
groups=('dlang')
url='https://github.com/CyberShadow/Digger'
license=('custom')
depends=('git')
makedepends=('dmd>=2.067.0-1' 'libphobos-devel' 'dtools')
source=(
    "git+https://github.com/CyberShadow/Digger.git#tag=v${pkgver//_/-}"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/Digger"
  git submodule update --init
  rdmd -g --compiler=dmd --build-only digger.d
}

package() {
  mkdir -p \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/doc/dlang-digger" \
		"${pkgdir}/usr/share/licenses/dlang-digger"

  install -m755 "${srcdir}/Digger/digger" "${pkgdir}/usr/bin/digger"
  install -m644 "${srcdir}/Digger/"{digger,bisect}.ini.sample  "${pkgdir}/usr/share/doc/dlang-digger"
  install -m644 "${srcdir}/Digger/LICENSE.md" "${pkgdir}/usr/share/licenses/dlang-digger/LICENSE"
}
