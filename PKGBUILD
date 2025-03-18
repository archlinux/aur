# Maintainer: puma <58333920+Stoppedpuma@users.noreply.github.com>

_pkgname=oculante
pkgname=oculante-git
pkgver=0.9.2.r82.g5bbb3d4e
pkgrel=1
depends=('aom' 'libwebp' 'expat' 'freetype2' 'gtk3' 'cairo' 'libheif' 'libjpeg-turbo')
makedepends=('rust' 'cargo' 'nasm' 'cmake')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A minimalistic image viewer with analysis and editing tools"
url="https://github.com/woelper/oculante"
source=("git+https://github.com/woelper/oculante")
sha512sums=('SKIP')
license=('MIT')
provides=("${pkgname}")
conflicts=("${_pkgname}")

pkgver () {
  cd "${srcdir}/oculante"
  git describe --long --tags --abbrev=8 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/oculante"

  cargo build --release --no-default-features --features notan/shaderc --features jxlcms --features dav1d --features j2k --features heif --features turbo
}

package() {
  cd "$srcdir/oculante"
  install -Dm755 target/release/oculante "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 res/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
	install -Dm644 res/oculante.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
