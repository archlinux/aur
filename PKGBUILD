# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

pkgname=netatop-bpf-git
pkgver=1
pkgrel=1
pkgdesc="Userspace BPF loader/daemon to allow atop to gather per-process network stats."
arch=(x86_64)
url=https://github.com/bytedance/netatop-bpf
license=(MIT)
depends=(atop)
makedepends=(git clang llvm)
source=($pkgname::git+$url)
b2sums=(SKIP)

pkgver() {
	cd $pkgname
	printf "%s.%s.$pkgrel" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $pkgname
	git submodule update --init --recursive
}

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	make SBINPATH=/usr/bin SYSDPATH=/usr/lib/systemd/system DESTDIR="$pkgdir" install
}
