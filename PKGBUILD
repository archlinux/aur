# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-hooks-contrib
_pkgname=pyinstaller-hooks-contrib
pkgver=2022.15
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('custom:PyInstaller')
makedepends=(
  "python-installer"
)
_pkgname_prefix="${_pkgname:0:1}"
_pkgname_underscored="${_pkgname//-/_}"
_py="py2.py3"
_py_hosted_url="https://files.pythonhosted.org/packages/$_py"
_pkg_whlname="$_pkgname_underscored-$pkgver-$_py-none-any.whl"
source=("$_py_hosted_url/$_pkgname_prefix/$_pkgname/$_pkg_whlname")
sha512sums=('3b1ab0a063d6ae606c4547aaf47abf453051caffb68815c7b05fa351113582c951eb24e17a4564343cafbaf40947b06997b4d472ab4db43d034630203172137e')

package() {
  cd "$srcdir" || exit 1
  python -m installer --destdir="$pkgdir" "${_pkg_whlname}"
  install -vDm 644 "${_pkgname//-/_}-$pkgver.dist-info/LICENSE"* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
