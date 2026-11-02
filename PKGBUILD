# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-zerotier"
pkgver=1.2.2
pkgrel=1
pkgdesc="mkinitcpio hook that initialises ZeroTier One to assist in the remote unlocking of encrypted partitions"
url="https://gitlab.archlinux.org/alphajack/mkinitcpio-zerotier"
license=("GPL-3.0-or-later")
arch=("any")
depends=("bash" "mkinitcpio" "zerotier-one")
optdepends=("mkinitcpio-systemd-extras: network connectivity and SSH server (systemd initrd)"
            "mkinitcpio-netconf: network connectivity (busybox initrd)"
            "mkinitcpio-tinyssh: SSH server (busybox initrd)"
            "mkinitcpio-dropbear: SSH server (busybox initrd)"
            "mkinitcpio-utils: encryptssh hook for remote unlocking (busybox initrd)"
            "binutils: inspection of unified kernel images in check-initcpio-zerotier")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('a4803d14f84ee500455f19b8400c55a64d32dcad7d3eaaba5713903c6992caba699f52e5833938fa6d659f87a1bcc9d2de35d582ab4530533e90be520448be33')
backup=("var/lib/zerotier-one/initcpio/config.ini")
install="$pkgname.install"

package(){
 cd "$pkgname-v$pkgver"
 install -D -m 644 "zerotier_config" "$pkgdir/var/lib/zerotier-one/initcpio/config.ini"
 install -D -m 644 "zerotier_hook" "$pkgdir/usr/lib/initcpio/hooks/zerotier"
 install -D -m 644 "zerotier_install" "$pkgdir/usr/lib/initcpio/install/zerotier"
 install -D -m 644 "zerotier_presets" "$pkgdir/usr/lib/mkinitcpio-zerotier/presets.sh"
 install -D -m 755 "zerotier_check" "$pkgdir/usr/bin/check-initcpio-zerotier"
 install -D -m 644 "zerotier_alpm_hook" "$pkgdir/usr/share/libalpm/hooks/mkinitcpio-zerotier.hook"
 install -D -m 755 "zerotier_alpm_script" "$pkgdir/usr/share/libalpm/scripts/mkinitcpio-zerotier"
}
