# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia-pathops
_pkgname=${pkgname#python-}
pkgver=0.6.0.post3
pkgrel=1
pkgdesc='Python bindings for the Skia library’s Path Ops (wheel)'
arch=('x86_64')
url="https://github.com/fonttools/$_pkgname"
license=('BSD')
depends=('python')
makedepends=('python-pip')
options=(!strip)
_py=cp39
_wheel="${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('55ec8dd73f71c8366f60bb7ca5989651d7e570b61438827d3e3603cebb2fc3f4')

# If anybody wants to mess around with the Chromium tree and figure out how to
# build skia from source on Arch I'm open to patches, but even after mucking
# around with ninja and python2 and various patched build toolchains I have
# come up short of a way to build this against Arch packages as dependencies.
# Drop a comment on the AUR page if you have ideas.

package() {
	export PIP_CONFIG_FILE=/dev/null
	pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
	python -O -m compileall "$pkgdir"
}
