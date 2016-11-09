pkgbase=python-pyxmpp2-git
pkgname=('python-pyxmpp2-git' 'python2-pyxmpp2-git')
pkgver=2.0alpha2.1165
pkgrel=1
pkgdesc="The new and shiny XMPP implementation for Python"
arch=('any')
license=('LGPL-2.1')
url="https://github.com/Jajcus/pyxmpp2"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=()
provides=('')
conflicts=('')
source=("git+https://github.com/Jajcus/pyxmpp2.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir"/pyxmpp2
	echo "$(python -c "print(\"$(python setup.py --version)\".split('-')[0])").$(git rev-list --count HEAD)"
}

prepare() {
	cd "$srcdir"/pyxmpp2
	sed -e "/use_setuptools(/d" -i setup.py
}

package_python-pyxmpp2-git() {
  depends=('python')
  optdepends=('python-dnspython')

  cd pyxmpp2
  python setup.py make_version
  python setup.py build --build-base=py3-build
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/python-pyxmpp2/COPYING
}

package_python2-pyxmpp2-git() {
  depends=('python2')
  optdepends=('python2-dnspython')

  cd pyxmpp2
  python2 setup.py make_version
  python2 setup.py build
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/python2-pyxmpp2/COPYING
}
