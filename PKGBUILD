# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Co-maintainer: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

_name="jira"
_module="$_name"
_cmd="jirashell"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Python library for interacting with JIRA via REST APIs"
pkgver="1.0.10"
pkgrel=2
url="https://github.com/pycontribs/jira"
license=('BSD')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('409a0a94800f05a1e8e078540eb5610e243586bd5ee9bc8cae8899cbb061898')

build() {
    cd "$_name-$pkgver"
    python setup.py build
    python2 setup.py build
}

package_python-jira(){
    depends=("python-pbr"
             "python-requests-oauthlib>=0.6.1"
             "python-requests>=2.10.0"
             "python-requests-toolbelt"
             "python-setuptools>=20.10.1"
             "python-six>=1.10.0"
             "python-defusedxml")
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-jira(){
    depends=("python2-pbr"
             "python2-requests-oauthlib>=0.6.1"
             "python2-requests>=2.10.0"
             "python2-requests-toolbelt"
             "python2-setuptools>=20.10.1"
             "python2-six>=1.10.0"
             "python2-defusedxml")
    cd "$_name-$pkgver"
    python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
    mv "$pkgdir/usr/bin/$_cmd" "$pkgdir/usr/bin/$_cmd-python2"
}
