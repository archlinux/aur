# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.53
pkgrel=1
pkgdesc="A modern static site generator designed to simplify building and maintaining project documentation"
url="https://github.com/zensical/zensical"
license=('MIT')
depends=('python' 'glibc' 'libgcc' 'python-jinja' 'python-deepmerge' 'python-pygments' 'python-pandas' 'python-tabulate'
  'python-markdown' 'python-click' 'python-yaml' 'python-tomli' 'python-pymdown-extensions')
optdepends=(
  'mkdocstrings-python: mkdocstrings plugin compatability'
)
makedepends=('python-pip' 'python-wheel')
arch=('x86_64' 'aarch64' 'i686')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

_cpver="cp310"
source=("https://raw.githubusercontent.com/zensical/zensical/refs/tags/v$pkgver/LICENSE.md")
source_x86_64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
source_i686=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_i686.manylinux2014_i686.whl")
sha256sums=('ac044e6db7ba08069f635afc1759b0ae11a7d47f79144a4ccdd16fc94ba47d1e')
sha256sums_x86_64=('10b0cb72861b14bd985bc5ad0203c35b1da7a19c87c194df3189fab7a910db04')
sha256sums_aarch64=('4ca63b952b4961461b4376d61603adc2bf9d81b4df4946b2f27e20b2726f881f')
sha256sums_i686=('30ed22e9fcedda71888d9fe84f4fdb1aadd3b66cdb0223716f1eecce9ae22b07')

package() {
  cd "${srcdir}"
  pip install \
    --no-deps \
    --no-build-isolation \
    --ignore-installed \
    --root="${pkgdir}" \
    --prefix=/usr \
    "zensical-$pkgver-$_cpver-abi3-manylinux_2_17_$CARCH.manylinux2014_$CARCH.whl"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
