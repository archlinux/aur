# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=cycle-cli
_pkgname=cycle
pkgver=0.0.2
pkgrel=3
pkgdesc='A command-line utility for indoor bike.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/jmelahman/cycle-cli'
license=('MIT')
makedepends=('go' 'git')
_commit='645962e51022ba72333e036a7d118d0bf0f3ad3a'
source=("${_pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "${_pkgname}" || exit
  go mod download
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
