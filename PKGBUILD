pkgbase=coreutils-uutils-symlink
pkgname=(${pkgbase} coreutils-uutils-arch)
pkgver=$(uu-true --version |cut -d' ' -f2)
pkgrel=9
arch=('any')
url='https://uutils.github.io/'
depends=(uutils-coreutils)
package_coreutils-uutils-symlink() {
	pkgdesc="(use at own risk) symlinks to replace coreutils with uutils"
	depends+=(nix-busybox)
	conflicts=(coreutils b3sum sha3sum coreutils-uutils)
	provides=(coreutils b3sum)
	mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
	for f in $(uu-coreutils --list)
	do
		ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
		ln -sf /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
	done
	echo '#!/usr/bin/uu-coreutils false' |tee "$pkgdir"/usr/bin/{ch,run}con
	chmod 755 "$pkgdir"/usr/bin/{ch,run}con
	ln -sf /usr/lib/nix/busybox "$pkgdir"/usr/bin/stty
	rm "$pkgdir"/usr/{bin,share/man/man1}/{arch,kill,more,uptime,hostname}*
}

package_coreutils-uutils-arch() {
	pkgdesc="symlink to /usr/bin/arch for few apps"
	conflicts=(coreutils-arch)
	provides=(coreutils-arch)
	mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
	ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/arch
	ln -sf /usr/share/man/man1/uu-arch.1.gz "$pkgdir"/usr/share/man/man1/arch.1.gz
}
