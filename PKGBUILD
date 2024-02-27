# Maintainer: Kimiblock Moe
pkgname=rime-moe-pinyin
pkgver=3.0
pkgrel=1
_tag=28e356614db6c4ae7f0d0e84d43e8cb59583c07a
pkgdesc="moeOS RIME 拼音方案"
arch=('any')
url="https://github.com/Kimiblock/moeOS-pinyin"
license=('GPL-3.0-or-later')
depends=()
provides=('rime-moe-pinyin')
source=("git+https://github.com/Kimiblock/moeOS-pinyin.git#tag=${_tag}")
sha256sums=("SKIP")

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


