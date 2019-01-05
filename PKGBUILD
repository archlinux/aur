# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-usersettings
pkgver=1.0.7
pkgrel=3
pkgdesc="Python module for easily managing persistent settings using an editable format and stored in an OS-appropriate location."
arch=('any')
url="https://pypi.org/project/usersettings"
license=("BSD")
depends=("python" "python-appdirs")
makedepends=("python-setuptools")
source=(
    "https://files.pythonhosted.org/packages/df/d3/b66294b2500f21fbeaa47e52bd5be90be3f2315e09bea2839ee0eeeb151b/usersettings-1.0.7.tar.gz"
    "python3-compat.patch"
)
sha256sums=(
    "c48c48f7bc1f00facc74da5ecfb6e1d95c66fc46d9e054c774958570f780d535"
    "409b69dc535a380197635598ec86b14ee851b3cc8f41c6cc9d51297ce433cc08"
)

prepare() {
    cd "usersettings-${pkgver}"
    patch < "${srcdir}/python3-compat.patch"
}

package() {
    cd "usersettings-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    for _file in $(ls -1 docs/*); do
        install -Dm644 ${_file} "${pkgdir}/usr/share/doc/python-usersettings/$(basename ${_file})"
    done
    install -dm755 "${pkgdir}/usr/share/licenses/python-usersettings"
    mv "${pkgdir}/usr/share/doc/python-usersettings/LICENSE.txt" "${pkgdir}/usr/share/licenses/python-usersettings"
}
