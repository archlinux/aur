# Maintainer: phoepsilonix <phoepsilonix at gmail dot com>
# Contributor: Stefano Capitani <stefanoatmanjarodororg>
# Contributor: star2000 <i@star2000.work>
# Contributor: Sam L. Yes <manjaroyes123@outlook.com>

pkgbase=manjaro-asian-input-support
_pkgbase=input-support
pkgname=(
    "ibus-$_pkgbase"
    "fcitx-$_pkgbase"
    "fcitx5-$_pkgbase"
)
pkgver=20250913
pkgrel=1
pkgdesc="Asian input support from Manjaro"
arch=('any')
url="https://gitlab.manjaro.org/packages/extra/manjaro-asian-input-support"
license=('GPL-3.0-or-later')
source=(
	'enable-fcitx5.sh'
	'fcitx5.profile'
	'enable-fcitx.sh'
	'enable-ibus.sh'
	'ibus.desktop'
	'start-ibus.sh'
)
conflicts=(
        "${pkgbase}-ibus"
        "${pkgbase}-fcitx"
        "${pkgbase}-fcitx5"
)
sha256sums=('03c77db4e8dc64cae722d01ea953e5c8ec07026fc91c9fad5cd1dff7b4fb1cce'
            'ea9bcf79078a9d77fcfc72071463e1fddcd6c0788af172267a402ed8b609ec7a'
            '3e9c5209d00497d750c4aeca84123d9ec30e74a51050236ef4d76512fbce3133'
            'ae82a5d89dc25c0a3c529c843eaffcf07a3fe9bf270db735a1fe4dc378ba013b'
            '8035781b1812ee1f289e0cdd0d26828534d7090272be3954e00cec364eba44e7'
            '87d7d6a0396815b3f7dbde4c3dc8714fa8055d16b1419ae3b19f86627a1899a7')

#pkgver() {
#	date +%Y%m%d
#}

package_ibus-input-support() {
	pkgdesc+=" for ibus"
	depends=('ibus')
	install=ibus-input-support.install
	optdepends=(
		'ibus-libpinyin: 中文 | Chinese'
		'ibus-anthy: 日本語 | Japanese'
		'ibus-hangul: 한국어 | Korean'
		'ibus-unikey: Tiếng Việt | Vietnamese'
#		'ibus-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'  ## AUR
	)
	provides=("${pkgbase}-ibus")
	conflicts=(
		"$pkgbase-fcitx"
		"$pkgbase-fcitx5"
	)

	install -Dm644 "$srcdir/enable-ibus.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/ibus.desktop" "$pkgdir/etc/xdg/autostart/ibus.desktop"
	mkdir -p $pkgdir/usr/lib/$_pkgbase/
	install -Dm755 "$srcdir/start-ibus.sh" "$pkgdir/usr/lib/$_pkgbase/start-ibus.sh"
}

package_fcitx-input-support() {
	pkgdesc+=" for fcitx"
	install=input-support.install
	depends=(
		'fcitx-qt5'        # QT input module
		'fcitx-configtool' # gui configuration tool
	)
	optdepends=(
		'kcm-fcitx: KDE configuration module'
		'fcitx-googlepinyin: 中文 | Chinese'
		'fcitx-cloudpinyin: 云拼音 | Use internet resources to provide candidate input for Chinese'
		'fcitx-mozc: 日本語 | Japanese'
		'fcitx-hangul: 한국어 | Korean'
		'fcitx-unikey: Tiếng Việt | Vietnamese'
		'fcitx-sayura: සිංහල | Sinhalese'
		'fcitx-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'
	)
	conflicts=(
		"$pkgbase-fcitx5"
		"$pkgbase-ibus"
	)
	provides=("${pkgbase}-fcitx")

	install -Dm644 "$srcdir/enable-fcitx.sh" "$pkgdir/etc/profile.d/input-support.sh"
}

package_fcitx5-input-support() {
	pkgdesc+=" for fcitx5"
	install=fcitx5-input-support.install
	depends=(
		'fcitx5-qt'         # QT input module
		'fcitx5-gtk'        # GTK input module
		'fcitx5-configtool' # gui configuration tool
	)
	optdepends=(
		'fcitx5-chinese-addons: 简体中文 | Simplified Chinese'
		'fcitx5-rime: 繁體中文 | Traditional Chinese'
		'fcitx5-mozc: 日本語 | Japanese'
		'fcitx5-anthy: 日本語 | Japanese'
		'fcitx5-hangul: 한국어 | Korean'
		'fcitx5-unikey: Tiếng Việt | Vietnamese'
		'fcitx5-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'
	)
	conflicts=(
		"$pkgbase-fcitx"
		"$pkgbase-ibus"
	)
	provides=("${pkgbase}-fcitx5")

	install -Dm644 "$srcdir/enable-fcitx5.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/fcitx5.profile" "$pkgdir/etc/xdg/fcitx5/profile"
}
