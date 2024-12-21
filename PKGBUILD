# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="payload_dumper"
_name="${pkgname//_/-}"
_commit_rel="a3c4e6cd6ada14b418d9fec8706c0c1362c8bfb8" # 0.3.0
_commit="146952dfdbd758a8beb27028a25fb0dac8b7c00a" # r28
pkgver="0.3.0+r28+g${_commit::7}"
pkgrel=1
pkgdesc="Dump the payload.bin image found in Android update images"
arch=('any')
url="https://github.com/5ec1cff/${_name}"
license=('custom:None')
depends=('python>=3.8' 'python-bsdiff4>=1.2.3' 'python-enlighten>=1.12'
         'python-httpx>=0.23.1' 'python-protobuf>=3.20')
makedepends=('python-build' 'python-installer' 'python-poetry-core'
             'python-wheel')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('7024dec33d1ee65db15a85daca39d6055a0a7686bc9b51a4e6822880f39eaea62b242928978bd70fb743907dca599127e9939d17b4de3519044995c6c20d450d')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
