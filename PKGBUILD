# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Atom Long <atom.long@hotmail.com>

_pkgname=hass-nabucasa
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.84.0
pkgrel=1
pkgdesc="Home Assistant cloud integration by Nabu Casa, Inc."
arch=('any')
url="https://github.com/NabuCasa/hass-nabucasa"
license=("GPL-3.0-or-later")
depends=(python-acme python-aiohttp python-atomicwrites-homeassistant python-attrs python-ciso8601 python-cryptography python-pycognito python-pyjwt python-snitun python-webrtc-models)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('ea048e0fadb56c025ba89c49d1e367317e04d52531b4d18082e3361647be10ef')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
