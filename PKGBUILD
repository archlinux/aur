# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=Akianonymus/gdrive-downloader
_source_type=github-releases
_upstreamver=$(date +%Y%m%d)
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgbase=$_pkgname
pkgname=$_pkgname-git
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view --json description -q .description $_repo)"
arch=(any)
url=https://github.com/$_repo
makedepends=(git)
license=(UNLICENSE)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::git+$url")
# _arch="$(uname -m|sed s/x86_64/amd64/)"
# _os="${OSTYPE%%-*}"
# [[ $_os == windows ]] && _ext=zip || _ext=tar.gz
# source=("$_pkgname-$pkgver::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
# source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$pkgname-$pkgver.tar.gz")
# _py=py2.py3
# source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(SKIP)

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D release/bash/* -t "$pkgdir/usr/bin"
	# python setup.py install --root="$pkgdir" --optimize=1 || return 1
	# cd "$srcdir"
	# cp -L "$_pkgname-$pkgver" "${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	# python -m installer --destdir="$pkgdir" *.whl || return 1
}
