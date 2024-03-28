# Maintainer: Kimiblock Moe
pkgname=rime-moe-pinyin
pkgver=3.2
pkgrel=1
pkgdesc="moeOS RIME 拼音方案"
arch=('any')
url="https://github.com/Kimiblock/moeOS-pinyin"
license=('GPL-3.0-or-later')
depends=()
provides=('rime-moe-pinyin')
source=("git+https://github.com/Kimiblock/moeOS-pinyin.git#tag=${pkgver}")
sha256sums=('406186f5332719e80b840b1bdc63352984adef84921cf8b01ca55849cdccc496')

function prepare() {
	cd moeOS-pinyin
	git submodule update --init --depth 1 --remote
}

function package() {
	cd moeOS-pinyin
	mkdir -p "${pkgdir}/usr/share"
	cp "${srcdir}/moeOS-pinyin/rime-data" -r "${pkgdir}/usr/share"
	install -Dm644 "${srcdir}/moeOS-pinyin/default.yaml" "${pkgdir}/usr/share/moeOS-Docs/ibus-rime.conf.d/default.yaml"
	rm -r "${pkgdir}/usr/share/rime-data/others/rime-ice/others"
	rm -r "${pkgdir}/usr/share/rime-data/others/rime-setting/fonts"
	for dir in $(ls "${pkgdir}/usr/share/rime-data/others"); do
		rm -rf "${pkgdir}/usr/share/rime-data/others/${dir}/.git"
	done
	chmod -R 755 "${pkgdir}/usr/share/rime-data"
}


