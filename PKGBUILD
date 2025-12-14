# Maintainer: Vishal Kannan <vishalkannan070@gmail.com>
pkgname=linux-toolkit
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight, menu-driven TUI for Linux system administration."
arch=('any')
url="https://github.com/VISHALKANNAN070/linux-toolkit"
license=('MIT')
depends=('bash' 'dialog' 'fastfetch')
makedepends=() 

# This links to the release you just created
source=("$pkgname-$pkgver.tar.gz::https://github.com/VISHALKANNAN070/linux-toolkit/archive/v$pkgver.tar.gz")
sha256sums=('bd09ac0613217068d0009dcf9f573eac228381a2f29bba4d0c80bd7574f57be3')

package() {
    cd "$pkgname-$pkgver"

    # 1. Create a folder in the system to hold all your scripts and themes
    mkdir -p "$pkgdir/usr/share/$pkgname"

    # 2. Copy ALL files (themes, helper scripts, etc.) into that system folder
    cp -r * "$pkgdir/usr/share/$pkgname/"

    # 3. Create a launch command in /usr/bin
    # This script goes to the right folder before running toolkit.sh
    mkdir -p "$pkgdir/usr/bin"
    echo -e "#!/bin/bash\ncd /usr/share/$pkgname\nexec ./toolkit.sh \"\$@\"" > "$pkgdir/usr/bin/$pkgname"

    # 4. Make the launcher and main script executable
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/share/$pkgname/toolkit.sh"
}
