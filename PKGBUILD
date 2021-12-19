# Maintainer: vitorg <vitorg at ctrl-c dot club>
_pkgname=zap-aur
pkgname="${_pkgname}-git"
pkgver=r22.af87462
pkgrel=1
pkgdesc="A lightning fast AUR searcher"
arch=("x86_64")
url="https://github.com/Bowuigi/Zap"
license=("GPL3")
depends=("lua>=5.1")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "zap" -t "${pkgdir}/usr/local/bin/"
  install -D "rxi-json.lua" -t "${pkgdir}/usr/share/lua/$(lua -v | awk '{print $2}' | awk -F . '{print $1,$2}' | sed "s/ /./")/"
}
