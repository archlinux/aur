# Maintainer: menguele <menguele@disroot.org>

pkgname=twad-justinwayland-git
_pkgname=twad
pkgver=v0.30.0
pkgrel=1
pkgdesc='Manage DOOM engines and mods with the terminal wad launcher (JustinWayland fork)'
arch=('any')
url="https://github.com/zmnpl/twad"
license=('MIT')
makedepends=('go' 'git')
conflicts=('twad-git')
source=("git+https://github.com/JustinWayland/twad.git")
sha256sums=('SKIP')

pgkver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #echo "v0.26.0"
}

build() {
  cd "${srcdir}"/${_pkgname}
  #git checkout rc
  #export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  CGO_ENABLED=0 go build -o $pkgname .
}

package() {
  cd "${srcdir}"/${_pkgname}
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "${srcdir}/${_pkgname}"/LICENSE     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
