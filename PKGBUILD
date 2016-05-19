pkgname=initrd-dropbear
pkgver=r8.5f251a5
pkgrel=1
pkgdesc="Provider of systemd initramfs dropbear ssh server"
arch=('any')
license=('Apache')
depends=('systemd' 'dropbear')
makedepends=('git')
install=install.sh
url="https://aur.archlinux.org/${pkgname}"
source=("git+https://aur.archlinux.org/${pkgname}.git#branch=master")
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
    
    local basedir="$srcdir/$pkgname"

    install -D -m644 "$basedir/mkinitcpio-hook.sh"       "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
    install -D -m644 "$basedir/mkinitcpio-install.sh"    "$pkgdir/usr/lib/initcpio/install/$pkgname"
  
    install -D -m644 "$basedir/initrd-dropbear.network"  "$pkgdir/usr/lib/systemd/initrd-dropbear.network"
    install -D -m644 "$basedir/initrd-dropbear.service"  "$pkgdir/usr/lib/systemd/initrd-dropbear.service"
    
}
