# Maintainer: linfeng <2844126834@qq.com>

pkgname=kde-wine-helper
pkgver=1.1
pkgrel=1
pkgdesc="一个小工具，用于解决KDE上由于wine微信/企业微信来新消息时图标不显示/不闪烁导致无法知晓新消息是否到来的问题"
arch=('x86_64')
url="https://github.com/FengZhongShaoNian/kde-wine-helper"
license=('GPL-3.0')
depends=('cmake' 'extra-cmake-modules' 'qt5-base' 'kwindowsystem>=5.88.0')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/FengZhongShaoNian/kde-wine-helper/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=()
sha256sums=('067269ee6f133f6bcb4915d1b2e02dcf1b2ae640761845cd560b4a3c48550115')


prepare() {
    rm -rf ${pkgname}-${pkgver}
    mkdir -p ${pkgname}-${pkgver}
    tar -xf $pkgname-$pkgver.tar.gz -C ${pkgname}-${pkgver}
}

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake "../$pkgname-$pkgver"
	make
}

package() {
    mkdir -p "$pkgdir/opt/kde-wine-helper"
    mkdir -p "$pkgdir/usr/share/applications"
    cd "$pkgname-$pkgver/build"
    cp "$pkgname" "$pkgdir/opt/kde-wine-helper"
    cp -r "icons" "$pkgdir/opt/kde-wine-helper"
    cp "config.json" "$pkgdir/opt/kde-wine-helper"
    cp "kde-wine-helper.desktop" "$pkgdir/usr/share/applications/"
}

