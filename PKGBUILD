# Maintainer: Ischa Abraham <contact@ischa.dev>
pkgname=passh-agent-git
pkgver=0.2.0.8.gb3c6ba6
pkgrel=1
pkgdesc="An ssh-agent implementation to fetch your SSH keys from Pass."
url="https://github.com/MrPixelized/passh-agent"
license=("GPL3")
arch=("any")
provides=("passh-agent")
conflicts=("passh-agent")
makedepends=("rust" "cargo" "git")
source=("git+https://github.com/MrPixelized/passh-agent.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/passh-agent"
	git describe --long --tags | sed "s/^v//" | sed "s/-/./g"
}

build() {
	cd "$srcdir/passh-agent"
	pwd
	env CARGO_INCREMENTAL=0 cargo build --release
}

check() {
	cd "$srcdir/passh-agent"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "$srcdir/passh-agent"

    install -Dm755 "target/release/passh-agent" -t "$pkgdir/usr/bin/"
	install -Dm644 "extra/passh-agent.service" -t "$pkgdir/usr/lib/systemd/user/"
}
