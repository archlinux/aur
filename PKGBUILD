# Maintainer: Raafat Turki <raafat.turki@pm.me>

pkgname=genxrdb-git
pkgver=r14.9deed3d
pkgrel=1
pkgdesc='a tool that generates xresources from toml'
arch=(x86_64)
url='https://github.com/RaafatTurki/genxrdb'
license=(unknown)
makedepends=(git cargo)
provides=(genxrdb)
conflicts=(genxrdb)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  if git describe --long --tags &>/dev/null; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${pkgname%-git}"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/${pkgname%-git}/target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
