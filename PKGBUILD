# Maintainer: SelfRef <arch@selfref.dev>

_basename=lilipod
pkgname=${_basename}-git
pkgver=0.0.3.r0.g68b04f2
pkgrel=2
pkgdesc="Lilipod is a simple container manager, able to download, unpack and use OCI images from various container registries (git version)"
arch=('any')
url="https://github.com/89luca89/lilipod"
license=('GPL-3.0')
makedepends=('git' 'go')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://github.com/89luca89/lilipod.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_basename"
	make pty
	make lilipod
}

package() {
	cd "$_basename"
	install -Dm755 lilipod "$pkgdir"/usr/bin/lilipod
}
