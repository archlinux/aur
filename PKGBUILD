# Maintainer: Danny Dutton <duttondj@vt.edu>

_pkgname=webtorrent-desktop
pkgname=${_pkgname}-git
pkgver=v0.7.2.r4.gbf37202
pkgrel=2
pkgdesc="Streaming torrent client."
arch=('x86_64')
url="https://webtorrent.io/desktop"
license=('MIT')
makedepends=('npm' 'git' 'zip')
conflicts=('webtorrent-desktop' 'webtorrent-desktop-bin')
source=("${_pkgname}::git+https://github.com/feross/${_pkgname}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  npm install

  npm run package -- linux zip
}

package() {
  cd "$srcdir/$_pkgname/dist"

  install -dm755 "${pkgdir}/usr/share"
  install -dm755 "${pkgdir}/usr/bin"

  cp -a "WebTorrent-linux-x64" "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/WebTorrent" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "WebTorrent-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
