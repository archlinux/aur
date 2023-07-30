# Maintainer: iff <iff@ik.me>
pkgname="pay_respect"
pkgver=v0.1.0.r0.d29af0e
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=('x86_64')
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
	local tag=$(git tag --sort=v:refname | grep '^v[0-9]' | head -1)
	local commits_since=$(git rev-list $tag..HEAD --count)
	echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay_respect" "$pkgdir/usr/bin/pay_respect"
}

