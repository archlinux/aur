# Maintainer: brainlessbitch
# Contributor: brainlessbitch

pkgname=guifetch
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI fetch tool written in Flutter for Linux"
arch=('x86_64')
url="https://github.com/FlafyDev/guifetch"
license=('MIT')
depends=()
makedepends=('clang' 'cmake' 'ninja' 'flutter')

source=("git+https://github.com/FlafyDev/guifetch")
sha256sums=("SKIP")

package() {
  cd "guifetch"

  flutter build linux --release

  install -dm755 "${pkgdir}/opt/${pkgname}/"

  cd "$srcdir/$pkgname/build/linux/x64/release/bundle"
  local execfile="$(find . -mindepth 1 -maxdepth 1 -type f -perm /111)"
  install -Dm755 \
	  "${execfile}" \
	  "${pkgdir}/opt/${pkgname}/${pkgname}"

  cp -r 'lib/' "${pkgdir}/opt/${pkgname}/"
  cp -r 'data/' "${pkgdir}/opt/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"

  ln -s \
		"/opt/${pkgname}/${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
