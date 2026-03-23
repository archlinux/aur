pkgname=python-buildozer-git
_pkgname=buildozer
pkgver=1.5.0.131.g91ce81b
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop (git version)"
arch=('any')
url="https://github.com/kivy/buildozer"
license=('MIT')

depends=(
	'python'
	'python-colorama'
	'python-pexpect'
	'python-virtualenv'
	'python-sh'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
optdepends=('python-paramiko: remote builds')

provides=('python-buildozer')
conflicts=('python-buildozer')

options=(!emptydirs)

source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags --long --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
