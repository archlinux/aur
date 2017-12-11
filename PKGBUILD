# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: Dicebot <public@dicebot.lv>

pkgname=dlang-digger-git
pkgver=r520.83342af
pkgrel=1
pkgdesc="A tool to build D and bisect old D versions (git version)"
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/CyberShadow/Digger"
license=('custom')
depends=('git')
makedepends=('dmd' 'libphobos-devel' 'dtools')
source=("git+https://github.com/CyberShadow/Digger.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/Digger"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Digger"
  git submodule update --init
  rdmd -g -allinst --compiler=dmd --build-only digger.d
}

package() {
  mkdir -p \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/doc/dlang-digger-git" \
		"${pkgdir}/usr/share/licenses/dlang-digger-git"

  install -m755 "${srcdir}/Digger/digger" "${pkgdir}/usr/bin/digger"
  install -m644 "${srcdir}/Digger/"{digger,bisect}.ini.sample  "${pkgdir}/usr/share/doc/dlang-digger-git"
  install -m644 "${srcdir}/Digger/LICENSE.md" "${pkgdir}/usr/share/licenses/dlang-digger-git/LICENSE"
}
