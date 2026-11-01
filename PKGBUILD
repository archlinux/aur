# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="mkinitcpio-zerotier"
pkgver=1.2.1
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
b2sums=('e84283e55ec4b1189e45f56414a831f4080d86de0b320af41bd285b0a5364f6a7f422d005d13cea17958c7be64460d631c5984a8175550466da664c5e49e9db3')
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
