# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Submitter: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgbase=regex
pkgname=python38-regex
pkgver=2022.10.31
pkgrel=1
pkgdesc="Alternative python regular expression module."
arch=('x86_64')
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('Python' 'Apache')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/r/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83')
b2sums=('060822767ab28e26d000faa198f4226ba1e4600141a7b3e0f656df8d004b5007a0a7934057e608d524f6a21421573fbeb8a1be208ce69ba2d912a55d19fb3f22')

build() {
  cd "regex-${pkgver}"

  python3.8 -m build -wn
}

check() {
  cd "regex-${pkgver}"

  local _pyver=cpython-$(python3.8 -m 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "$PWD/build/lib.linux-$CARCH-$_pyver"
  python3.8 -m unittest regex/test_regex.py
}

package() {
  cd "regex-${pkgver}"

  python3.8 -m installer --d "${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
