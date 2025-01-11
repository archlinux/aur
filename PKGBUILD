# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-sssekai-git
pkgver=r164.6477cc4
pkgrel=1
pkgdesc="About Project SEKAI Asset Utility."
arch=('x86_64')
url="https://github.com/mos9527/sssekai"
license=('MIT')
provides=('sssekai')
conflicts=('python-sssekai')
depends=(
  'python-astc-encoder-py'
  'python-coloredlogs'
  'python-msgpack'
  'python-pyaxmlparser'
  'python-pycryptodome'
  'python-json-logger'
  'python-requests'
  'python-rich'
  'python-tqdm'
  'python-unitypy'
  'python-wannacri-git'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+https://github.com/mos9527/sssekai.git")
md5sums=('SKIP')

pkgver() {
  cd sssekai
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd sssekai
  pytest -v --cov || true
}

package() {
  cd sssekai
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
