# Maintainer: iff <iff@ik.me>
pkgname="pay_respects"
pkgver=v0.3.2.r0.e6a1daf
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=(any)
url="https://github.com/iffse/pay_respects"
license=('AGPL')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/iffse/pay_respects")
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
	install -Dm755 "target/release/pay_respects" "$pkgdir/usr/bin/pay_respects"
}

