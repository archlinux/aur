# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('python-imagehash-git')
_srcname='imagehash'
pkgdesc='A Python Perceptual Image Hashing Module'
pkgver='r98'
pkgrel='1'
arch=('any')
url="https://github.com/JohannesBuchner/${_srcname}"
license=('custom:BSD')

depends=('python' 'python-numpy' 'python-scipy' 'python-pillow' 'python-pywavelets')
makedepends=('git' 'python-setuptools')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

package() {
    cd "${srcdir}/${_srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
