pkgname=initrd-dropbear
pkgver=r30.5dd8113
pkgrel=1
pkgdesc="Provider of systemd initramfs dropbear ssh server"
arch=('any')
license=('Apache')
depends=('systemd' 'dropbear')
makedepends=('git')
install=install.sh
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=${pkgname}"
source=("${pkgname}::git+https://aur.archlinux.org/${pkgname}.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    
    local source="$srcdir/$pkgname"

    local target="pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$pkgname"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$pkgname"
  
    local target="$pkgdir/usr/share/mkinitcpio/$pkgname"
    install -D -m644 "$source/readme.md"                "$target/readme.md"
    install -D -m644 "$source/initrd-dropbear.service"  "$target/initrd-dropbear.service"
    install -D -m644 "$source/initrd-network.network"   "$target/initrd-network.network"
    install -D -m644 "$source/initrd-network.service"   "$target/initrd-network.service"
    
}
