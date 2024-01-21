# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-privy
_name=privy
pkgver=6.0.0
pkgrel=1
pkgdesc="An easy, fast lib to correctly password-protect your data"
arch=('any')
url="https://github.com/ofek/privy"
license=('Apache-2.0 AND MIT')
depends=('python-cryptography' 'python-argon2_cffi')
makedepends=('python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl"
        "https://raw.githubusercontent.com/ofek/privy/master/LICENSE-MIT")
sha256sums=('e68679bb4006ce83206d9a7af1158cf4d56a2ed6861ee39276907be618dfb8d9'
            'd502748a33db7ade1318e37f0b5f219f478330ed74a673e387756e53fb516715')

check() {
  pytest
}

package() {
  python -m installer --destdir="$pkgdir" *.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"

  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
