# Maintainer: Alexander Belov markelofaleksei@gmail.com

pkgname=limine-booster
pkgver=1.0.1
pkgrel=1
pkgdesc="Automates Limine bootloader entries for kernels using Booster"
arch=('any')
url="https://github.com/abshka/limine-booster"
license=('GPL3')
depends=('booster' 'limine')
optdepends=('intel-ucode: For automatic detection and inclusion of Intel microcode'
            'amd-ucode: For automatic detection and inclusion of AMD microcode')
# This is the standard way to package a project with its own install script.
install="${pkgname}.install"
# The source now points to a specific release tarball on GitHub.
# This is the standard and required practice for AUR.
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7fa240e887c8555c5377398718f8940ac28ba26b7362c81f635fc128b1407e96')

# The prepare() function is used to perform actions on the source code
# before building. Here, we can set the correct permissions if needed.
prepare() {
    cd "$pkgname-$pkgver"
    chmod +x limine-booster-update
}

# The package() function now installs files from the extracted source directory.
package() {
    cd "$pkgname-$pkgver"

    # Install the main script
    install -Dm755 "limine-booster-update" "$pkgdir/usr/bin/limine-booster-update"

    # Install the default configuration file
    install -Dm644 "limine-booster.conf" "$pkgdir/etc/default/limine-booster.conf"

    # Install the pacman hook
    install -Dm644 "91-limine-booster.hook" "$pkgdir/usr/share/libalpm/hooks/91-limine-booster.hook"
}

# vim: set ts=4 sw=4 et:
