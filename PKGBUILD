# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.52
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
sha256sums_x86_64=('6df854d07f5d89a47f37f661058bc3f95efc64d45b0d5500ea46821244f69c16')
sha256sums_aarch64=('2d889b32121fa43061a902c49d976353a674ae566803ac0ea5d41f01aa5da131')
sha256sums_i686=('9d09e7fd0d80418639482212fbce19d09877cbef92a4122030e5d19b32dbea08')

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
