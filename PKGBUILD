# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>

_pyver=cp313
_mlver="manylinux_2_28_$CARCH"

pkgname=python-skia
_pkgname=skia-python
pkgver=87.8
pkgrel=2
pkgdesc='Python binding to Skia Graphics Library (wheel)'
arch=(x86_64 ararch64)
url="https://github.com/kyamagu/$_pkgname"
license=(BSD-3-Clause)
depends=(fontconfig opengl-driver python)
makedepends=(python-installer)
options=(!strip)
_wheel="${_pkgname/-/_}-$pkgver-$_pyver-$_pyver-$_mlver.whl"
source=("https://files.pythonhosted.org/packages/$_pyver/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('2e9bd721d8c6159639a397dd861d2144f795aea74c1c6426808167038549b31c')

# If anybody wants to muck around with the Chromium tree and figure out how to
# build skia from source on Arch I'm open to patches, but even after mucking
# around with ninja and Python2 and various patched bulid toolchains I have
# come up short of a way to build this against Arch packages. Drop a comment on
# the AUR page if you have ideas.

package() {
	python -m installer --destdir="$pkgdir" $_wheel
	python -O -m compileall "$pkgdir"
}
