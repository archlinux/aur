# Maintainer: bobpaul

_pkgbase=yj
pkgname=${_pkgbase}-git
pkgver=v5.1.0.r18.g8016400
pkgrel=1
pkgdesc="Convert YAML <=> TOML <=> JSON <=> HCL"
url="https://github.com/sclevine/yj"
depends=()
makedepends=('go')
provides=('yj')
conflicts=('yj')
license=('APACHE')
arch=('x86_64' 'power' 'powerpc64' 'powerpc64le')
source=("yj::git+https://github.com/sclevine/yj.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/yj"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/yj"
  # TODO setting version does not work with gcc-go
  go build -ldflags="-X main.Version=${pkgver#v}"
}

package() {
  cd "$srcdir/yj"
  install -D -m755 ${_pkgbase} "${pkgdir}/usr/bin/${_pkgbase}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
