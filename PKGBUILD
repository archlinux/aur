# Maintainer: iff <iff@ik.me>
pkgname="pay_respect"
pkgver=v0.3.0.r0.16e90c7
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=(any)
url="https://github.com/iffse/pay_respect"
license=('AGPL')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/iffse/pay_respect")
sha1sums=('SKIP')

build() {
	cd "$pkgname"
	cargo build --release
}

pkgver() {
	cd "$pkgname"
	local tag=$(git describe --tags --abbrev=0)
	local commits_since=$(git rev-list $tag..HEAD --count)
	echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay_respect" "$pkgdir/usr/bin/pay_respect"
}

