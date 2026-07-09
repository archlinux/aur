# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.50
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
sha256sums_x86_64=('a64f957f94f7d8e8847a7f1e8205509ba4b188c93c157c5e7be49bcb8556a127')
sha256sums_aarch64=('2bbf3034a2cb1a9d2a72a5ee7047688717c93da0d8a90d25dd871db8d5f33a6d')
sha256sums_i686=('8813d1f8895b19520d4a982d6bfcfd06372d73d96e6a63f0d2cf8f3b6036d5a1')

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
