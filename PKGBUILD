# Maintainer: Firstp1ck <al.leuzi@hotmail.com>
pkgname="hyprland-simple-setup-git"
pkgver="0.4.0"
pkgrel=2
pkgdesc="Setup Hyprland the simple way. (Swiss/German Edition)"
arch=('any')
url="https://github.com/Firstp1ck/Hyprland-Simple-Setup.git"
license=('GPL3')
makedepends=('git')
depends=('git' 'sudo'
'bash'
'base-devel'
'xdg-user-dirs')
source=("$pkgname::git+https://github.com/Firstp1ck/Hyprland-Simple-Setup.git")
sha256sums=('SKIP')

package() {
    cd "$pkgname"
    
    # Install all files to /usr/share/$pkgname
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -a . "$pkgdir/usr/share/$pkgname/"
    
    # Find and install setup.sh
    if [ -f "setup.sh" ]; then
        # If setup.sh is in root directory
        install -Dm755 "setup.sh" "$pkgdir/usr/bin/hyprland-simple-setup-git"
    else
        # Look in subdirectories
        for dir in */; do
            if [ -f "${dir}setup.sh" ]; then
                install -Dm755 "${dir}setup.sh" "$pkgdir/usr/bin/hyprland-simple-setup-git"
                break
            fi
        done
    fi
}

post_install() {
    echo "==> Run 'hyprland-simple-setup-git' to start the Hyprland setup."
}
