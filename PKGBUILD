# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=noahp/emoji-fzf
_source_type=github-tags
_upstreamver='0.6.0'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view $_repo|rg 'description:\t'|cut -f2)"
arch=(any)
url=https://github.com/$_repo
depends=(fzf)
makedepends=(python-installer)
license=(MIT)
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
_py=py2.py3
source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(SKIP)

package() {
	cd "$srcdir"
	cp -L "$_pkgname-$pkgver" "${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	python -m installer --destdir="$pkgdir" *.whl || return 1
}
