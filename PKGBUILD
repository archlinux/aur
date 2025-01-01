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
pkgver=20250101
pkgrel=1
pkgdesc="Asian input support from Manjaro"
arch=('any')
url="https://gitlab.manjaro.org/packages/extra/manjaro-asian-input-support"
license=('GPL-3.0-or-later')
source=(
	'enable-fcitx.sh'
	'enable-ibus.sh'
	'fcitx5.profile'
	'ibus.desktop'
)
install=input-support.install
conflicts=(
        "${pkgbase}-ibus"
        "${pkgbase}-fcitx"
        "${pkgbase}-fcitx5"
)
sha256sums=('4bc4de1c154be161479447de148786bfccbd89c90ccece6503b5fc1b8b7c2877'
            '14e19f6f0473fefbb75832edf6799d2aef4df211b63449746856d35910fe64dc'
            'ea9bcf79078a9d77fcfc72071463e1fddcd6c0788af172267a402ed8b609ec7a'
            '894b0ffb45094d09557be13250c1893621292a2340884a6d2f1401f10d3a4883')

pkgver() {
	date +%Y%m%d
}

package_ibus-input-support() {
	pkgdesc+=" for ibus"
	depends=('ibus')
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
}

package_fcitx-input-support() {
	pkgdesc+=" for fcitx"
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

	install -Dm644 "$srcdir/enable-fcitx.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/fcitx5.profile" "$pkgdir/etc/xdg/fcitx5/profile"
}
