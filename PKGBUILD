# Maintainer: IThundxr <me@ithundxr.dev>

pkgname=swift-bundler-git
_pkgname=${pkgname%-git}
pkgver=v2.0.3.r301.gaa7af2e
pkgrel=1
_pkgtype=debug
pkgdesc="An Xcodeproj-less tool for creating cross-platform Swift apps."
arch=(x86_64 aarch64)
url="https://github.com/stackotter/swift-bundler"
license=('Apache License 2.0')
depends=(swift-language patchelf)
makedepends=(git)
optdepends=(
  'rpm-tools: to use the linux RPM bundler'
  'appimagetool: to use the linuxAppImage bundler'
)
source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  swift build -c $_pkgtype
}

check() {
  cd "$_pkgname"

  swift test -c $_pkgtype
}

package() {
  cd "$_pkgname"

  install -Dm755 .build/$_pkgtype/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}