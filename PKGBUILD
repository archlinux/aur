pkgname=package-installer
pkgver=1.0
pkgrel=1
arch=('x86_64')
url="https://gitlab.com/package-installer-gui/PKG-installer"
license=('GPL')
source=("https://gitlab.com/package-installer-gui/PKG-installer/-/raw/main/package-installer.tar")
sha256sums=("SKIP")
install=package_installer.install

# Define architecture-specific dependencies as space-separated strings
declare -A arch_depends=(
    [x86_64]="dependency1 dependency2"
)

# Assign dependencies based on the current architecture
IFS=' ' read -r -a depends <<< "${arch_depends[$CARCH]}"

package() {
    cd "$srcdir"
    tar -xvf package-installer.tar
    install -Dm755 package-installer "$pkgdir/usr/bin/package-installer"
    install -Dm644 package_installer.desktop "$pkgdir/usr/share/applications/package_installer.desktop"
    install -Dm644 arch_pkg.png "$pkgdir/usr/share/icons/arch_pkg.png"
}
