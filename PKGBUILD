# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

pkgname=mkinitcpio-systemd-tool
pkgver=r2.505d480
pkgrel=1
pkgdesc='Provisioning tool for systemd in initramfs (systemd-tool)'
arch=('any')
license=('Apache')
depends=('systemd' 'dropbear')
makedepends=('git')
install='INSTALL.sh'
url="https://github.com/random-archer/${pkgname}"
source=("https://github.com/random-archer/${pkgname}.git")
md5sums=('SKIP')
backup=(
    'etc/mkinitcpio.d/crypttab'
    'etc/mkinitcpio.d/shell.sh'
    'etc/systemd/network/initrd-network.network'
    'etc/systemd/system/initrd-build.sh'
    'etc/systemd/system/initrd-cryptsetup.service'
    'etc/systemd/system/initrd-debug-progs.service'
    'etc/systemd/system/initrd-debug-shell.service'
    'etc/systemd/system/initrd-dropbear.service'
    'etc/systemd/system/initrd-network.service'
    'etc/systemd/system/initrd-user-root.service'
)
conflicts=(
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)

pkgver() {
    local base=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    local repo="$base/$pkgname"
    local count=$(git -C $repo rev-list --count HEAD)
    local short=$(git -C $repo rev-parse --short HEAD)
    printf "r%s.%s" "$count" "$short"
}

prepare() {
    true
}

build() {
    true
}

check() {
    true
}

package() {
    
    local hook="systemd-tool"
    
    local source="$srcdir/$pkgname"
    
    local target="$pkgdir/usr/share/$pkgname"
    install -D -m644 "$source/LICENSE.md"               "${target}/LICENSE.md"
    install -D -m644 "$source/README.md"                "${target}/README.md"

    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$hook"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$hook"
  
    local target="$pkgdir/etc/mkinitcpio.d/"
    install -D -m644 "$source/crypttab"                 "$target/crypttab"
    install -D -m755 "$source/shell.sh"                 "$target/shell.sh"
        
    local target="$pkgdir/etc/systemd/network"
    install -D -m644 "$source/initrd-network.network"    "$target/initrd-network.network"

    local target="$pkgdir/etc/systemd/system"
    install -D -m644 "$source/initrd-build.sh"              "$target/initrd-build.sh"
    install -D -m644 "$source/initrd-cryptsetup.service"    "$target/initrd-cryptsetup.service"
    install -D -m644 "$source/initrd-debug-progs.service"   "$target/initrd-debug-progs.service"
    install -D -m644 "$source/initrd-debug-shell.service"   "$target/initrd-debug-shell.service"
    install -D -m644 "$source/initrd-network.service"       "$target/initrd-network.service"
    install -D -m644 "$source/initrd-dropbear.service"      "$target/initrd-dropbear.service"
    install -D -m644 "$source/initrd-user-root.service"     "$target/initrd-user-root.service"
                
}
