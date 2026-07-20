# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.51
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
sha256sums_x86_64=('67f813a1514a90890ca86248a8d54b81b2164bcbff11a6bcf11b01e1c01a1454')
sha256sums_aarch64=('3c9579809f88608e7aa2cff516fff9d267d74a843cf6088a5f4227de2f092bb5')
sha256sums_i686=('f779d2d87b4bf228cf2e279bc0ae6bcf3b36a9335ff283a317d01f7c15ae46b2')

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
