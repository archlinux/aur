# Maintainer: David Torralba Goitia <david.torralba.goitia@gmail.com>
_name=direnv-backup
pkgname="${_name}-git"
pkgver=0.1.1
pkgrel=1
pkgdesc="Tool to backup/restore direnv files with optional encryption."
arch=("any")
url="https://github.com/dtgoitia/${_name}"
source=("${_name}-${pkgver}::git+${url}.git?tag=${pkgver}")
sha256sums=('SKIP')

provides=($_name)
conflicts=($_name "${_name}-git" "${_name}-bin")
license=("GLP3")
depends=("python")
optdepends=("gnupg: backup encryption/decryption support")
makedepends=("git" "python-build" "python-installer" "python-wheel")

build () {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --outdir $srcdir
}

package() {
    wheel_file="$(find . -type f -name '*.whl')"

    if [[ ! -f "${wheel_file}" ]]; then
        echo "Could not find the wheel package" 1>&2
        exit 1
    fi

    python -m installer --destdir="$pkgdir" "${wheel_file}"
}
