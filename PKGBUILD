# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgbase=python-librefang-sdk-git
pkgname=('python-librefang-sdk-git')
pkgver=2026.5.31beta.16.r0.g2bef7a0f5
pkgrel=2
pkgdesc='Python Client SDK for the LibreFang Agent OS (GIT version)'
arch=('any')
url='https://github.com/librefang/librefang'
license=('MIT' 'Apache-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python')
provides=('python-librefang-sdk')
conflicts=('python-librefang-sdk')

source=("${pkgbase}::git+https://github.com/librefang/librefang.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgbase}"
    git describe --long --tags --match 'v[0-9]*' | sed 's/^v//; s/-\(beta\|alpha\|rc\)/\1/g; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "${srcdir}/${pkgbase}/sdk/python"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgbase}/sdk/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "${srcdir}/${pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
