# Maintainer: Jonas Schmid <aur at jonasschmid dot ch>
pkgname=gap-riscv-toolchain
pkgver=1.8
pkgrel=1
pkgdesc="GAP RISC-V Toolchain installer"
arch=('x86_64')
url="https://example.com"
license=('custom')
depends=()
source=("git+https://github.com/GreenWaves-Technologies/gap_gnu_toolchain.git")
md5sums=('SKIP')

# Custom installation directory
pkgdir_default="/opt/riscv"
install_dir=""

prepare() {
    msg "Preparing package directory..."
    install_dir="${pkgdir_default}"
}

build() {
    msg "No compilation needed for this toolchain."
}

package() {
    msg "Installing toolchain to the package directory..."
    if [ -n "$install_dir" ]; then
        install -d "$pkgdir/$install_dir"
    else
        install -d "$pkgdir/$pkgdir_default"
    fi
    rsync -av --delete --exclude ".git*" . "$pkgdir/$pkgdir_default"
    
    # Adding a post-install message for .bashrc configuration
    post_install_message
}

post_install_message() {
    if [ "$install_dir" != "$pkgdir_default" ]; then
        echo "Add to $HOME .bashrc or user-wide profile script"
        echo "export GAP_RISCV_GCC_TOOLCHAIN=\"$DIR_TOOLCHAIN\""
    fi
}
