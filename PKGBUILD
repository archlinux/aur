# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pyrime
pkgname=python-$_pkgname
pkgver=0.2.2
pkgrel=1
pkgdesc="rime for python, attached to prompt-toolkit keybindings for some prompt-toolkit applications such as ptpython"
arch=(x86_64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python librime python-platformdirs python-wcwidth)
makedepends=(python-installer)
optdepends=(ptpython python-prompt_toolkit python-ptpython python-pynvim python-colorama)
license=(GPL3)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('be5016ae7eb849f35581296f0febee73ffe8630871eb509167c6e82a3f08940d')

build() {
	cd "$srcdir/pyrime-$pkgver" || return 1
	uv build --wheel
}

package() {
	python -minstaller -d"$pkgdir" "$srcdir/pyrime-$pkgver/dist"/*.whl
}
