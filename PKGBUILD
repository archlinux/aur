# Maintainer: Rafael Epplée <raffomania@gmail.com>
pkgname=love-release-git
pkgver=r133.f43a111
pkgrel=1
pkgdesc="A Bash script to make LÖVE games releases easier"
arch=('any')
url="https://github.com/MisterDA/love-release"
license=("unknown")
depends=("zip" "unzip" "curl" "lua")
makedepends=("make" "git")
optdepends=("wine: for building windows packages"
	"dpkg: for building debian packages"
	"android-sdk: for building android packages"
	"android-sdk-platform-tools: for building android packages"
	"android-sdk-build-tools: for building android packages"
	"android-ndk: for building android packages")
source=('love-release-git::git+https://github.com/MisterDA/love-release.git')
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	mkdir -p \
		"$pkgdir/usr/bin" \
		"$pkgdir/usr/share/love-release" \
		"$pkgdir/usr/share/man/man1" \
		"$pkgdir/usr/share/bash-completion/completions"
	cd "$pkgname"
	make \
		BINARY_DIR="$pkgdir/usr/bin" \
		INSTALL_DIR="$pkgdir/usr/share/love-release" \
		MANPAGE_DIR="$pkgdir/usr/share/man/man1" \
		COMPLETION_DIR="$pkgdir/usr/share/bash-completion/completions" \
		install
}
