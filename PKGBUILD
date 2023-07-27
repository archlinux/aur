# Maintainer: linfeng <2844126834@qq.com>
pkgname="global-appmenu-applet-whose-menu-mnemonic-has-been-disabled-git"
pkgver=0.8.1
pkgrel=1
epoch=
pkgdesc="This is a Plasma 5 applet that shows the current window appmenu in your panels. This plasmoid is coming from Latte land but it can also support Plasma panels. The menu mnemonic has been disabled so you are able to use Alt key as a shortcut modifier in your app without worrying about conflicts. The name of this applet after install is Window AppMenu."
arch=('i686' 'x86_64')
url="https://github.com/FengZhongShaoNian/applet-window-appmenu.git"
license=('GPL')
groups=()
makedepends=('gcc' 'git' 'extra-cmake-modules')
depends=('plasma-framework' 'kdecoration' 'plasma-workspace')
conflicts=('plasma5-applets-window-appmenu' 'plasma5-applets-window-appmenu-git' 'applet-window-appmenu-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FengZhongShaoNian/applet-window-appmenu/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()
#pkgver() {
#  cd "$pkgname"
#  ( set -o pipefail
#    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  )
#}

prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    tar -xf $pkgname-$pkgver.tar.gz -C ${pkgname}-${pkgver}
}

build() {
    cd "$pkgname-$pkgver/applet-window-appmenu-$pkgver"
	if ! [ -a build ] ; then
	    mkdir build
	fi
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release  .. -Wnodev
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver/applet-window-appmenu-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
