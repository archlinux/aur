# Maintainer: AntiApple4life <antiapple at antiapple dot net>
# Contributor: Mees Valkenburg <`echo Zmx1ZmZ5QGdvZG90LnVrLnRvCg== | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>
# Contributor: Daniel Dulaney <dan@dulaney.xyz>

pkgname='dtrx-git'
pkgver=8.5.3.r2.gb0e9cb1
pkgrel=1
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/dtrx-py/dtrx'
license=('GPL3')
depends=('python3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'tar: to extract tar, deb, and gem archives'
  'unzip: to extract zip archives'
  'cpio: to extract cpio and rpm archives'
  'rpm-org: to extract rpm archives'
  'binutils: to extract deb archives'
  'gzip: deb, gem, gzip, and compress archives'
  'bzip2: to extract deb and bzip2 archives'
  'xz: to extract xz archives'
  'p7zip: to extract 7z archives'
  'unrar: to extract rar archives'
  'cabextract: to extract MS Cabinet archives'
  'unshield: to extract InstallShield archives'
  'lha: to extract lzh archives'
)
provides=(dtrx)
conflicts=(dtrx)

md5sums=('SKIP')
source=('git+https://github.com/dtrx-py/dtrx.git')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

