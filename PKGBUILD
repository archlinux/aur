# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=Akianonymus/gdrive-downloader
_source_type=github-releases
_upstreamver=$(date +%Y%m%d)
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname-git
pkgver=r94.b8ea865
pkgrel=1
pkgdesc="$(gh repo view --json description -q .description $_repo)"
arch=(any)
url=https://github.com/$_repo
makedepends=(git)
license=(UNLICENSE)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
# _arch="$(uname -m|sed s/x86_64/amd64/)"
# _os="${OSTYPE%%-*}"
# [[ $_os == windows ]] && _ext=zip || _ext=tar.gz
# source=("$_pkgname::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
# source=("$_pkgname::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$pkgname-$pkgver.tar.gz")
# _py=py2.py3
# source=("$_pkgname::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D release/bash/* -t "$pkgdir/usr/bin"
	# python setup.py install --root="$pkgdir" --optimize=1 || return 1
	# cd "$srcdir"
	# cp -L "$_pkgname" "${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	# python -m installer --destdir="$pkgdir" *.whl || return 1
}
