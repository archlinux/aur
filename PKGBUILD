# Maintainer: Marcel B <mr.arsikoff@gmail.com>
# Author: Sergio González <sergoncano on GitHub>
pkgname="grub-theme-hollow-knight"
_repo_name="hollow-knight-grub-theme"
pkgver=7ae57b6
pkgrel=1
pkgdesc="A Hollow Knight-inspired GRUB theme"
arch=("any")
url="https://github.com/sergoncano/hollow-knight-grub-theme"
license=("GPL-3.0")
source=("git+https://github.com/sergoncano/${_repo_name}.git")
install="pacman.install"
sha256sums=("SKIP")
makedepends=("git")

_install_dir="boot/grub/themes"

prepare() {
    cd "$srcdir/$_repo_name"
    # theme_selector.sh assumes that the theme files are in ${DIRECTORY}/hollow-grub, but they are in ${DIRECTORY} itself
    # shellcheck disable=SC2016
    sed -i 's/${DIRECTORY}\/hollow-grub/${DIRECTORY}/' theme_selector.sh
}

pkgver() {
    cd "$srcdir/$_repo_name"
    git rev-parse --short HEAD
}

package() {
    cd "$srcdir/$_repo_name"

    mkdir -p "$pkgdir/$_install_dir"

    cp -R "./hollow-grub" "$pkgdir/$_install_dir/"
    _install_dir="$_install_dir/hollow-grub"
    cp -R "./wallpapers" "$pkgdir/$_install_dir/"
    chmod -R 644 "$pkgdir/$_install_dir"

    install -m755  "./theme_selector.sh" "$pkgdir/$_install_dir"
}

