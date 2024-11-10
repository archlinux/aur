# Maintainer: Jan Fader <jan.fader@web.de>

pkgname=python-ansibug
pkgver=0.2.0
_name=${pkgname#python-}
pkgrel=1
pkgdesc='Debug Adapter Protocol for Ansible'
arch=('any')
url='https://github.com/jborean93/ansibug'
license=('MIT')
depends=('python3' 'ansible-core' 'python-debugpy' 'python-argcomplete')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('b89ea8b41f0547b070b6f4abb0e1d03899425f39bdcfc3a81dc4399e2b47bc93')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
