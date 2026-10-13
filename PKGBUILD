# PKGBUILD forked from https://aur.archlinux.org/packages/jid by:
# Maintainer: Edoardo Rosa <edoz90 at archlinux dot info>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=jid
pkgname=jid-git
pkgver=1.1.3.r0.ge5c5a9d
pkgrel=1
pkgdesc='JSON incremental digger'
url='https://github.com/simeji/jid'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
makedepends=('go' 'git')
provides=('jid')
conflicts=('jid')
source=("git+$url")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
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
    -ldflags "${extraflags}" -mod=readonly \
    -o "${_pkgname}" ./cmd/jid
}

package() {
  install -Dm755 "$_pkgname/jid" "$pkgdir/usr/bin/$_pkgname"
}
# vim:set ts=2 sw=2 et:
