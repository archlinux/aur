# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=venthur/gscholar
_source_type=github-tags
_upstreamver='2.0.0'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=python-$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view --json description -q .description $_repo)"
arch=(any)
# arch=(x86 x86_64 arm aarch64)
url=https://github.com/$_repo
makedepends=(python-installer)
license=(MIT)
provides=("$_pkgname")
conflicts=("$_pkgname")
# install=$_pkgname.install
# source=("$_pkgname::$url/archive/$_upstreamver.tar.gz")
# source=("$_pkgname::git+https://github.com/$_repo")
# _arch="$(uname -m|sed s/x86_64/amd64/)"
# _os="${OSTYPE%%-*}"
# [[ $_os == windows ]] && _ext=zip || _ext=tar.gz
# source=("$_pkgname::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
source=("$_pkgname::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
# _py=py2.py3
# source=("$_pkgname::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(44ab51a0f9c153515cfc48e87286b5088a9c7ba534b2728ca92e9637d233ccd4)

# pkgver() {
#   cd "$srcdir/$_pkgname"
#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# }

package() {
  # cd "$srcdir/$_pkgname"
  # install -D "$_pkgname" -t "$pkgdir/usr/bin"
  # make DESTDIR="$pkgdir" install
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 || return 1
  # cd "$srcdir"
  # cp -L "$_pkgname" "${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
  # python -m installer --destdir="$pkgdir" *.whl || return 1
  install -D -m644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
}
