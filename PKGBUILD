# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='xwinclone'
pkgver='0.1p'
pkgrel='2'
pkgdesc="Used to translate another window's content in its own window"
arch=('any')
url="https://github.com/awpe/${pkgname}"
depends=('xorg-server-common' 'libxmu' 'libxcomposite' 'imlib2' 'libjpeg-turbo')
makedepends=('git' 'gcc' 'make')
license=('BSD 3-Clause')
source=("$pkgname::git+${url}"
	"${pkgname}.desktop"
	"${pkgname}-auto.desktop")
sha256sums=("SKIP"
	    "ff78212c263df89f0eeecc3de20878f5896a2263fbd192a2cef26b68770de9dd"
	    "6ff7aa0e4f9e59371a8136780bda2acd7faac05e543dc6e4425ae259da638b2e")
install=("${pkgname}.install")

prepare() {
  cd "${pkgname}"
  git checkout master
}

build() {
  cd "${pkgname}"
  make
}

package() {
  pushd "${pkgname}"
  install -Dm775 "bin/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/doc/${pkgname}/LICENSE.md"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  popd
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}-auto.desktop" "$pkgdir/etc/xdg/autostart/${pkgname}.desktop"
}
