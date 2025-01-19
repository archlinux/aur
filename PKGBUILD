# Maintainer:     AImixAE    <aimixae@outlook.com>
# Contributor:    Giteeajake <giteeajake@qq.com>
pkgname=gcc-kawaii-plugin-zh
pkgver=0.0.1
pkgrel=1
pkgdesc='a gcc plugin and make your gcc kawaii :)'
arch=('any')
url="https://github.com/Bill-Haku/kawaii-gcc"
license=('GPL-3.0-or-later')
depends=('gcc' 'gettext')
source=("${pkgname}::git+${url}")
sha256sums=(SKIP)

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
	cd "$srcdir/$pkgname/build"
	if [[ -f "$srcdir/$pkgname/build/zh-kawaii.mo" ]]; then
		exit 1
	fi
}

package() {
	cd "$srcdir/$pkgname/build"
	rm -rf ja-kawaii.mo
	rm -rf zh-origan.mo
	# install -D LICENSE "$pkgdir" /usr/share/licenses/$pkgname/LICENSE
	sudo mv /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo.bak
	sudo cp "$srcdir/$pkgname/build/zh-kawaii.mo" /usr/share/locale/zh_CN/LC_MESSAGES/gcc.mo
}

