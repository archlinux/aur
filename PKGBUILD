pkgname=('python-imagehash-git')
srcname='imagehash'
pkgdesc='A Python Perceptual Image Hashing Module'
pkgver='r1'
pkgrel='1'
arch=('any')
url='https://github.com/JohannesBuchner/imagehash'
license=('custom:BSD')

depends=('python' 'python-numpy' 'python-scipy' 'python-pillow')
makedepends=('git' 'python-setuptools')
provides=('imagehash')
conflicts=('imagehash')

source=("${srcname}::git+https://github.com/JohannesBuchner/imagehash.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${srcname}"

    printf 'r%s.%s\n' \
        "$( git rev-list HEAD | wc --lines )" \
        "$( git describe --always | sed 's/-/./g' )"
}

package() {
    cd "${srcdir}/${srcname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
