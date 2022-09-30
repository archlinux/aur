# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

# shellcheck disable=SC2034
_name="distlib"
pkgbase="python2-${_name}"
pkgname=("${pkgbase}")
pkgver=0.3.3
pkgrel=1
pkgdesc="Low-level components of distutils2/packaging"
arch=('any')
url="https://bitbucket.org/pypa/${_name}"
license=('PSF')
makedepends=('python2')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.zip")
sha256sums=('d982d0751ff6eaaab5e2ec8e691d949ee80eddf01a62eaa96ddb11531fe16b05')
b2sums=('269ec9e8f22c991fea6b81c37d9b527348bd5431fe09b02a7972e3272c379842df0254ae0c9e7283bc1b5a2402d9bd9087e2d1fdd979c1ac3a8b99cfb962c308')

# shellcheck disable=SC2154
prepare() {
    cd "${srcdir}"/${_name}-${pkgver} || exit

    rm distlib/*.exe

}

# shellcheck disable=SC2154
build() {
    cd "${srcdir}/${_name}-${pkgver}" || exit

    python2 setup.py build
}

# shellcheck disable=SC2154
check() {
    cd "${srcdir}"/${_name}-${pkgver} || exit

    python2 setup.py test
}

# shellcheck disable=SC2154
package() {
    depends=('python2')

    cd "${srcdir}/${_name}-${pkgver}" || exit
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
