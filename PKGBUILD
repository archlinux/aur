# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia
_pkgname=skia-python
pkgver=87.2
pkgrel=2
pkgdesc='Python binding to Skia Graphics Library (wheel)'
arch=(x86_64)
url="https://github.com/kyamagu/$_pkgname"
license=(BSD)
depends=(fontconfig opengl-driver python)
makedepends=(python-pip)
options=(!strip)
_py=cp39
_wheel="${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('abaa3c78850ed310a4a6b93ecd3e7b9276cd9a170defbaa6da896a2dcd1b642f')

# If anybody wants to muck around with the Chromium tree and figure out how to
# build skia from source on Arch I'm open to patches, but even after mucking
# around with ninja and Python2 and various patched bulid toolchains I have
# come up short of a way to build this against Arch packages. Drop a comment on
# the AUR page if you have ideas.

package() {
	export PIP_CONFIG_FILE=/dev/null
	pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
	python -O -m compileall "$pkgdir"
}
