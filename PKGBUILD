# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=xfce4-generic-slider-git
pkgver=26.d1fc31f
pkgrel=2
pkgdesc="Xfce panel plugin for adjusting the value passed to a command"
arch=(i686 x86_64)
license=('GPL')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-generic-slider"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('xfce4-dev-tools')
source=('git+https://gitlab.xfce.org/panel-plugins/xfce4-generic-slider'
        '0001-Use-plugin-API-2.0.patch'
        '0002-Make-it-build-with-GTK3.patch'
        '0003-Stop-using-some-things.patch'
        '0004-Use-GtkGrid-instead-of-GtkTable.patch'
        '0005-Change-the-packing-order.patch')

pkgver() {
	cd "$srcdir"/xfce4-generic-slider
	echo `git rev-list --count master`.`git rev-parse --short master`
}

build() {
	cd "$srcdir"/xfce4-generic-slider
        git apply ../0001-Use-plugin-API-2.0.patch
        git apply ../0002-Make-it-build-with-GTK3.patch
        git apply ../0003-Stop-using-some-things.patch
        git apply ../0004-Use-GtkGrid-instead-of-GtkTable.patch
        git apply ../0005-Change-the-packing-order.patch
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir"/xfce4-generic-slider
	make DESTDIR="$pkgdir" install
}

sha256sums=('SKIP'
            '14cc51fc23d6f047e7cbb8732e1b421705a48d05313238fbf5214f0083692487'
            'eb5dc13e27c2ecdc565a99024395c956eff21f06073a42bf6c809d20241b9d67'
            '46ba26148336db197c0abcaf87ea38168c9ad98ba35e3ef57ac26f46a189ea4a'
            '03df7e88edc4fdc6a2b6527b255060fae2819b70e64d9a9688a44eb5c29c0479'
            'b25a78a082adfc3a76091acd885bda82dce7a8e6e2a26cb1f23ecee1e81d44c1')
