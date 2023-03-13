# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg --apply
_repo=nachifur/MulimgViewer
_source_type=pypi-releases
_upstreamver='3.9.10'
_pkgname=$(tr A-Z a-z <<<${_repo##*/})
_pypi_package=$_pkgname

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=2
pkgdesc="A multi-image viewer that can open multiple images in one interface, which is convenient for image comparison and image stitching."
arch=(any)
url=https://github.com/$_repo
makedepends=(python-installer)
depends=(python-piexif python-pillow python-requests python-wxpython)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	"https://raw.githubusercontent.com/$_repo/master/assets/desktop/$_pkgname.desktop"
)
sha256sums=('e0c21750af6565e4358f211d900c39399cbd09b6f7d7435ca931dc47d81efba1'
            '95d09ce39c3cdfde1ac19b0ce6b95ef62a2c572b0a1e2c02ad7bdbf7bbfc24d1')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
	install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$pkgdir$(python -c'import sys; print(sys.path[-1])')/${_pkgname//-/_}/$_pkgname.png"  -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
}
