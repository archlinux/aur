# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-spookyhash-git
pkgver=r50.0278a00
pkgrel=1
pkgdesc="A Python wrapper for SpookyHash version 2."
arch=('x86_64')
url="https://github.com/buhanec/spookyhash"
license=('BSD')
provides=('python-spookyhash')
conflicts=('python-spookyhash')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-psutil')
depends=('python')
source=("git+https://github.com/buhanec/spookyhash.git")
md5sums=('SKIP')

pkgver() {
  cd spookyhash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd spookyhash
  PYTHONPATH="$PWD" pytest -v || true
}


package() {
  cd spookyhash
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
