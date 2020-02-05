# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mullpy
_name=mullvad_python
pkgver=0.3.1
pkgrel=1
pkgdesc="Unofficial Mullvad CLI tool to check if you're secured"
arch=('any')
url="https://github.com/franccesco/mullpy"
license=('MIT')
depends=('python-requests' 'python-colorama' 'python-click')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/$_name-$pkgver-py3-none-any.whl"
		"https://raw.githubusercontent.com/franccesco/$pkgname/master/LICENSE.md")
noextract=(*.whl)
sha256sums=('cd3a939d4f70e5f5c362fdff3a2e8704e3e0c67f7d0cc695436f77d31293266c'
            '9766ae1f6b83bdd3aedb76980ce0644c674fd3f52eaaa06612d589731549fe43')

package() {
	PIP_CONFIG_FILE=/dev/null pip install \
		--isolated \
		--root="$pkgdir" \
		--ignore-installed \
		--no-deps *.whl \
		--no-warn-script-location
	python -O -m compileall "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
