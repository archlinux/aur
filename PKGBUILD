# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgname='python2-urllib3'
_name="${pkgname#python2-}"
pkgver=1.26.7
pkgrel=1
pkgdesc='HTTP library with thread-safe connection pooling and file post support'
arch=('any')
url="https://github.com/${_name}/${_name}"
license=('MIT')
depends=('python2')
optdepends=(
  'python2-brotli: Brotli support'
  'python2-idna: support for internationalized domain names (IDNA)'
  'python2-pyopenssl: security support'
  'python2-pysocks: SOCKS support'
  'python-urllib3-doc: urllib3 documentation'
)
makedepends=(
  'python2-brotli'
  'python2-ndg-httpsclient'
  'python2-setuptools'
  'python2-pyasn1'
  'python2-pyopenssl'
  'python2-pysocks'
)
_tarname="${_name}-${pkgver}"
source=("${url}/archive/${pkgver}/${_tarname}.tar.gz"
        "${_name}-use-brotli-or-brotli-cffi.patch::${url}/pull/2099.patch")
sha512sums=('5a0f55cba31c987c416d113ddfd4ade64704f70e4ff20092ff6d7370f260dada71e149b14ea62c8967a4c0f5ad79b441325d623446e0016c133c7e9277d3c8be'
            '16bc19caf4b0d80ccb7aae7ee0cf4a7b6fef754d6d7b9e3bc0da9197afffa4f587f197c7fdffa56c14d40da806633cd409b5d8136ca4d1acef414afaf42d1e0f')

prepare() {
  patch -d "${_tarname}" -p1 -i "../${_name}-use-brotli-or-brotli-cffi.patch" || :
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
