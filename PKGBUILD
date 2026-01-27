# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pyrime
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=1
pkgdesc="rime for python, attached to prompt-toolkit keybindings for some prompt-toolkit applications such as ptpython"
arch=(x86_64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python librime python-platformdirs python-wcwidth)
makedepends=(python-installer)
optdepends=(ptpython python-prompt_toolkit python-ptpython python-pynvim python-colorama)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('33904432f6969930a1f831362eb5b95aa88e097a8ccb6325bc074298af8627ec')

build() {
	cd "$srcdir/pyrime-$pkgver" || return 1
	uv build --wheel
}

package() {
	python -minstaller -d"$pkgdir" "$srcdir/pyrime-$pkgver/dist"/*.whl
}
