# Maintainer: oech3

pkgname=coreutils-uutils-symlink
pkgver=0.0.29
pkgrel=4
pkgdesc="(use at own risk) symlinks to replace coreutils with uutils"
arch=('any')

depends=(uutils-coreutils nix-busybox)
conflicts=(coreutils b3sum sha3sum coreutils-uutils)
provides=(coreutils b3sum)

package() {
	mkdir -p "$pkgdir"/usr/bin
	for f in $(uu-coreutils --list)
	do ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
	done
	rm "$pkgdir"/usr/bin/{kill,more,uptime}
	ln -sf /usr/lib/nix/busybox "$pkgdir"/usr/bin/stty
	#for f in find xargs #error in makepkg.
	#do ln -sf /usr/bin/uutils-"$f" "$pkgdir"/usr/bin/"$f"
	#done
}
