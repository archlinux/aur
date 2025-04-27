# Maintainer: Fernando Ortiz <nandub+arch [at] nandub.info>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=python-pyalsaaudio-git
pkgname=(python-pyalsaaudio-git)
_pkgname=pyalsaaudio
pkgver=0.11.0.r0.g0b3f1f4
pkgrel=1
pkgdesc="ALSA wrappers for Python (development version)"
arch=('i686' 'x86_64' 'armv7h')
url="http://larsimmisch.github.io/pyalsaaudio/"
license=('custom: PSF')
depends=('alsa-lib' 'glibc')
conflicts=('python-pyalsaaudio')
provides=('python-pyalsaaudio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/larsimmisch/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

_archive="${_pkgname}"

build() {
  cd "${_archive}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_archive}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
