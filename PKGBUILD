pkgname=photon-rss-git
_pkgname=photon
pkgver=0.1.0.11
pkgrel=1
pkgdesc="Fast RSS reader as light as a photon"
arch=("i686" "pentium4" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://git.sr.ht/~ghost08/photon"
license=("GPL3")
makedepends=(
	"go>=1.16"
	"git"
)
optdepends=(
	"youtube-dl: A command-line program to download videos from YouTube.com and a few more sites"
	"mpv: a free, open source, and cross-platform media player"
	"imv: Image viewer for Wayland and X11"
)
source=("${_pkgname}::git+https://git.sr.ht/~ghost08/photon")
sha256sums=("SKIP")

prepare(){
  cd "$_pkgname"
  mkdir -p build/
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -tags nox11 .
}

package() {
  cd "$_pkgname"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/photon
}
