# Maintainer: Carlos Mogas da Silva <r3pek@r3pek.org>

_pkgname=matrix-synapse-rest-password-provider
pkgname=matrix-synapse-rest-auth
pkgver=v0.1.4.r25.g53fbc12
pkgrel=2
pkgdesc='REST endpoint Authentication module for synapse'
arch=('any')
url='https://github.com/anishihara/matrix-synapse-rest-password-provider'
license=('AGPL3')
depends=('python' 'python-twisted' 'matrix-synapse')
makedepends=('git')

source=("${_pkgname}"::"git+https://github.com/anishihara/matrix-synapse-rest-password-provider.git"
        'Update-set_profile_displayname-to-use-UserID-type.patch')
sha256sums=('SKIP'
            '5fb2cfbf8ae32c7ca2d17d01f67a3492b70a7631f865c657ceb4b4ecac7d5285')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    patch -Np1 < '../Update-set_profile_displayname-to-use-UserID-type.patch'
}

package() {
    cd "${_pkgname}"

    PYTHON_LOCATION=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

    # File
    install -dm 755 "${pkgdir}"/${PYTHON_LOCATION}
    install -m 644 rest_auth_provider.py "${pkgdir}"/${PYTHON_LOCATION}/rest_auth_provider.py
}
