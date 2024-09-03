# Maintainer: Kimiblock Moe
pkgname=rime-moe-pinyin
pkgver=3.5
pkgrel=1
pkgdesc="moeOS RIME 全拼方案"
arch=('any')
url="https://github.com/Kimiblock/moeOS-pinyin"
license=('GPL-3.0-or-later')
depends=("fcitx5-pinyin-moegirl-rime" "rime-pinyin-zhwiki")
provides=('rime-moe-pinyin')
source=("git+https://github.com/Kimiblock/moeOS-pinyin.git#tag=${pkgver}")
sha256sums=("SKIP")
makedepends=("git")

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
	for dir in $(ls "${pkgdir}/usr/share/rime-data/others"); do
		rm -rf "${pkgdir}/usr/share/rime-data/others/${dir}/.git"
	done
	chmod -R 755 "${pkgdir}/usr/share/rime-data"
}


