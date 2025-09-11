_pkgname=media-fetcher
pkgname=moonlight-media-fetcher-git
pkgver=r30.gee13270
pkgrel=1
pkgdesc='Provides MPRIS info to Media Controls for Moonlight (Discord)'
_reponame="my-moonlight-extensions"
url='https://github.com/NotNite/$_reponame'
arch=('x86_64')
makedepends=('git' 'cargo' 'clang')
license=('MIT-0')
source=("git+https://github.com/NotNite/my-moonlight-extensions")
sha256sums=('SKIP')
provides=('media-fetcher')
conflicts=()
_workdir="src/mediaControls/$_pkgname"

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed 's/^media-fetcher-releases.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_reponame/$_workdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$_reponame/$_workdir"
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
