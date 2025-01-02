# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=release-tag
_pkgname=tag
pkgver=0.3.0
pkgrel=1
pkgdesc='Automatically create semantic version git tags.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/tag'
license=('MIT')
makedepends=('go' 'git')
_commit='bbc4ac03498c9dd8685ea44f6e58a084b56dc5cb'
source=("${_pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit

  git describe --tags | sed 's/^v//'
}

build() {
  cd "${_pkgname}" || exit

  go build -ldflags="-X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "${_pkgname}"
}

package() {
  cd "${_pkgname}" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
