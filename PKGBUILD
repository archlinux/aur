# PKGBUILD forked from https://aur.archlinux.org/packages/jiq by:
# Maintainer: Edoardo Rosa <edoardo dot rosa 90 at gmail dot com>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=jiq
pkgname=jiq-git
pkgver=0.7.2.r3.geca3be1
pkgrel=1
pkgdesc='jid on jq - git trunk'
url='https://github.com/fiatjaf/jiq'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('jq')
makedepends=('go' 'git')
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -modcacherw \
    -ldflags "${extraflags}" \
    -o "${_pkgname}" ./cmd/jiq
}

package() {
  install -Dm755 "$_pkgname/jiq" "$pkgdir/usr/bin/$_pkgname"
}
# vim:set ts=2 sw=2 et:
