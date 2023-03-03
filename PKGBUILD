# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=nachifur/MulimgViewer
_source_type=pypi-releases
_upstreamver='3.9.9'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="A multi-image viewer that can open multiple images in one interface, which is convenient for image comparison and image stitching."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-numpy python-piexif python-pillow python-requests python-wxpython)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/master/assets/desktop/MulimgViewer.desktop"
)
sha256sums=('e1d1a13f2b7a6cb6850e79a18d96ac37e9be0e18eeb3508a8000df0d10df1799'
            '0078ae602cfaa6fc0230dce60c96130267318d4151324b0497d9cce26b027896')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
	install -Dm644 MulimgViewer.desktop -t "$pkgdir/usr/share/applications"
}
