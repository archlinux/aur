# Maintainer: oech3

pkgname=coreutils-uutils-symlink
pkgver=0.0.29
pkgrel=2
pkgdesc="(use at own risk) symlinks to replace coreutils with uutils"
arch=('x86_64')
license=('MIT')
url="https://uutils.github.io/"

depends=(uutils-{coreutils,findutils-bin})
provides=(coreutils findutils b3sum)
conflicts=(coreutils findutils b3sum sha3sum coreutils-uutils)

package() {
	mkdir -p "$pkgdir"/usr/bin
	for f in $(uu-coreutils --list)
	do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
	done
	rm "$pkgdir"/usr/bin/{kill,more,uptime}
	for f in find xargs #Is diffutils-bin incomplete?
	do ln -sf /usr/bin/uutils-"$f" "$pkgdir"/usr/bin/"$f"
	done
}
