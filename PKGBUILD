# Maintainer: Abdullah Al Muaz <abdullahalmuaz15@gmail.com>
pkgname=botflix-git
pkgver=r152.346f31c
pkgrel=1
pkgdesc="🎥 Stream your favorite movie from the terminal!"
arch=('any')
url="https://github.com/kaboussi/Botflix"
license=('MIT')
groups=()
depends=('nodejs' 'npm' 'python' 'python-pip' 'python-simple-term-menu' 'scrapy' 'python-rich')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+https://github.com/kaboussi/Botflix.git)
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
# Git, tags available
        ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}


build() {
        if ! yay -Qi webtorrent-cli &> /dev/null && ! npm list -g webtorrent-cli &> /dev/null; then
                echo "Installing webtorrent-cli"
                yay -S --noconfirm --needed webtorrent-cli
        fi        
        
}

package() {
        cd "$srcdir/${pkgname%-git}"
        mkdir -p "$pkgdir/usr/share/${pkgname%-git}"
        cp -r . "$pkgdir/usr/share/${pkgname%-git}"

        mkdir -p "$pkgdir/usr/bin"
        echo "#!/bin/bash" > "$pkgdir/usr/bin/${pkgname%-git}"
        echo "python /usr/share/${pkgname%-git}/main.py" >> "$pkgdir/usr/bin/${pkgname%-git}"
        chmod +x "$pkgdir/usr/bin/${pkgname%-git}"
}

sha512sums=('SKIP')
