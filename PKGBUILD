# Maintainer: GrassBlock <i [at] gb0 [dot] dev>
pkgname=manboster-git
_name=manboster
pkgver=nightly.20260617.444.a2915e3
pkgrel=1
pkgdesc="Manboster: Your personal AI agent manbo lobster! (git version)"
arch=("x86_64")
url="https://manboster.dev/"
license=('Apache-2.0')
makedepends=("go" "git")
optdepends=('llama.cpp: for running local safety gatekeeper model')
provides=("manboster")
conflicts=("manboster")
source=('git+https://github.com/manboster/manboster.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_name"
    printf "nightly.%s.%s.%s" "$(git log -1 --format="%cd" --date=short | sed s/-//g)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_name}"
	go build -o $_name ./cmd/$_name
}

package() {
	cd "${_name}"
	install -Dm 755 manboster -t ${pkgdir}/usr/bin
}
