# Maintainer: Raymond Li <aur@raymond.li>
# Co-maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=i3lock-color
pkgver=2.13.c.5
pkgrel=1
pkgdesc="The world's most popular non-default computer lockscreen."
arch=('i686' 'x86_64')
url="https://github.com/Raymo111/i3lock-color"
license=('MIT')
depends=('xcb-util-image' 'pam' 'libev' 'cairo' 'libxkbcommon-x11'
         'libjpeg-turbo' 'xcb-util-xrm' 'pkgconf')
provides=('i3lock' 'i3lock-color')
conflicts=('i3lock' 'i3lock-color-git')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('46f15cbbf339873266e014f70b5e1ec02177f0295302b615a7bd85bef40d8ad2')

build() {
	cd "$pkgname-$pkgver"
	
	autoreconf -fi
	./configure --prefix="$pkgdir/usr/" \
        --sysconfdir="$pkgdir/etc/" \
        --enable-debug=no \
        --disable-sanitizers
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 i3lock-bash "${pkgdir}/usr/share/bash-completion/completions/i3lock"
    install -Dm644 i3lock-zsh "${pkgdir}/usr/share/zsh/vendor-completions/_i3lock"
}
