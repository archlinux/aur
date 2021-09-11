# Maintainer: star2000 <i@star2000.work>
# Contributor: Sam L. Yes <manjaroyes123@outlook.com>
# Contributor: Stefano Capitani <stefanoatmanjarodororg>

pkgbase=manjaro-asian-input-support
pkgname=(
	'ibus-input-support' 'fcitx-input-support' 'fcitx5-input-support'
)
pkgver=2021.09
pkgrel=1
arch=('any')
url="https://gitlab.manjaro.org/packages/community/manjaro-asian-input-support"
license=('GPL')
pkgdesc='Asian input support from Manjaro'
source=(
	'enable-fcitx.sh'
	'enable-ibus.sh'
	'fcitx5.profile'
	'ibus.desktop'
)
md5sums=('a5bcd9553acf94b9543b41d7d260793a'
         '7928e2fb103bafb07e32d1d36a8ab8ab'
         '3578677a7102c9f8be3b9f7ea7d3d06f'
         'f1a9f3406f8268383149889f4816cd52')
install=input-support.install
conflicts=(
	"${pkgbase}-ibus"
	"${pkgbase}-fcitx"
	"${pkgbase}-fcitx5"
)

package_ibus-input-support() {
	pkgdesc='Asian input support for ibus'
	depends=('ibus')
	optdepends=(
		'ibus-libpinyin: 中文 | Chinese'
		'ibus-anthy: 日本語 | Japanese'
		'ibus-hangul: 한국어 | Korean'
		'ibus-unikey: Tiếng Việt | Vietnamese'
		'ibus-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'
	)
	provides=("${pkgbase}-ibus")
	install -Dm644 "$srcdir/enable-ibus.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/ibus.desktop" "$pkgdir/etc/xdg/autostart/ibus.desktop"
}

package_fcitx-input-support() {
	pkgdesc='Asian input support for fcitx'
	depends=(
		'fcitx-qt5'        # QT input module
	)
	optdepends=(
		#'fcitx-qt4: required by some closed source Chinese IMEs'
		'fcitx-configtool: GUI configuration tool'
		'kcm-fcitx: KDE configuration module'
		'fcitx-googlepinyin: 中文 | Chinese'
		'fcitx-cloudpinyin: 云拼音 | Use internet resources to provide candidate input for Chinese'
		'fcitx-mozc: 日本語 | Japanese'
		'fcitx-hangul: 한국어 | Korean'
		'fcitx-unikey: Tiếng Việt | Vietnamese'
		'fcitx-sayura: සිංහල | Sinhalese'
		'fcitx-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'
	)
	provides=("${pkgbase}-fcitx")
	install -Dm644 "$srcdir/enable-fcitx.sh" "$pkgdir/etc/profile.d/input-support.sh"
}

package_fcitx5-input-support() {
	pkgdesc='Asian input support for fcitx5'
	depends=(
		'fcitx5-qt'  # QT input module
		'fcitx5-gtk' # GTK input module
	)
	optdepends=(
		'fcitx5-configtool: Configuration tool based on Qt5'
		'fcitx5-chinese-addons: 简体中文 | Simplified Chinese'
		'fcitx5-rime: 繁體中文 | Traditional Chinese'
		'fcitx5-anthy: 日本語 | Japanese'
		'fcitx5-hangul: 한국어 | Korean'
		'fcitx5-unikey: Tiếng Việt | Vietnamese'
		'fcitx5-m17n: other languages provided by M17n(http://www.nongnu.org/m17n/)'
	)
	provides=("${pkgbase}-fcitx5")
	install -Dm644 "$srcdir/enable-fcitx.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/fcitx5.profile" "$pkgdir/etc/xdg/fcitx5/profile"
}
