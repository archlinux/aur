# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>

_name=gaphor
pkgname=python-${_name}
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple and easy to use modeling tool for UML using GTK3"
arch=('any')
url="https://github.com/gaphor/${_name}"
license=('Apache')
depends=(
	'python-gaphas'
	'python-typing_extensions'
	'python-generic'
	'python-tinycss2'
)
makedepends=(
	'python-pip'
	'gendesk'
)
_wheelname="${_name/-/_}-$pkgver-py3-none-any.whl"
source=(
	"https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_wheelname}"
	"https://raw.githubusercontent.com/gaphor/${_name}/master/logos/org.gaphor.Gaphor.svg"
)
sha256sums=('9d0ccae7aecb41decec98ce2d14e5216c0ebbd8e82dc2c89b16e184ae94959eb'
            'ef938e113167fc25a0647c9559d5042c38d23e0667d1683c0d74a7a5d0290791')

prepare() {
	gendesk -f --pkgname="$_name" --pkgdesc="$pkgdesc" --categories=Development PKGBUILD
}

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location "${_wheelname}"
	rm "${pkgdir}"/usr/lib/python*/site-packages/gaphor-*.dist-info/direct_url.json
	install -Dm644 "$srcdir/${_name}.desktop" -t "$pkgdir"/usr/share/applications
	install -Dm644 "$srcdir/org.gaphor.Gaphor.svg" "$pkgdir"/usr/share/pixmaps/org.gaphor.Gaphor.svg
}

