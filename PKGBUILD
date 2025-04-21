# Maintainer: oech3

pkgname=coreutils-uutils-symlink
pkgver=0.0.29
pkgrel=8
pkgdesc="(use at own risk) symlinks to replace coreutils with uutils"
arch=('any')
depends=(uutils-coreutils nix-busybox)
conflicts=(coreutils b3sum sha3sum coreutils-uutils coreutils-arch)
provides=(coreutils b3sum coreutils-arch)

package() {
	mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
	for f in $(uu-coreutils --list)
	do
		ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
		ln -sf /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
	done
	echo '#!/usr/bin/uu-coreutils false' |tee "$pkgdir"/usr/bin/{ch,run}con
	chmod 755 "$pkgdir"/usr/bin/{ch,run}con
	ln -sf /usr/lib/nix/busybox "$pkgdir"/usr/bin/stty
	rm "$pkgdir"/usr/{bin,share/man/man1}/{kill,more,uptime,hostname}*
}
