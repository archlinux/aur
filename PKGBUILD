# Maintainer: Nicolai <Finic8@protonmail.com>
pkgname=zbectl-git
pkgver=v1.0.r18.gc23afd9
pkgrel=1
pkgdesc="Utility for managing ZFS Boot Environments in Arch Linux"
arch=(any)
url="https://github.com/Finic8/zbectl"
license=('GPL')
depends=('zfs' 'grub' 'efibootmgr')
makedepends=('git')
provides=('zbectl')
source=($pkgname::git+https://github.com/Finic8/zbectl)
md5sums=('SKIP')
pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$pkgname"
	install -D -m 755 zbectl "${pkgdir}/usr/bin/zbectl"
	install -D -m 755 08_zbectl "${pkgdir}/etc/grub.d/08_zbectl"
	install -D -m 644 70-grub-fix.rules "${pkgdir}/etc/udev/rules.d/70-grub-fix.rules"
	install -D -m 644 zbectl.8 "${pkgdir}/usr/share/man/man8/zbectl.8"
	install -D -m 644 zbectl.bash_completion "${pkgdir}/usr/share/bash-completion/completions/zbectl"
	install -D -m 644 zbectl.zsh_completion "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_zbectl"
}
