# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=zensical-bin
pkgver=0.0.60
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
arch=('x86_64' 'aarch64')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')

_cpver="cp310"
source=("https://raw.githubusercontent.com/zensical/zensical/refs/tags/v$pkgver/LICENSE.md")
source_x86_64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_cpver/z/zensical/zensical-$pkgver-$_cpver-abi3-manylinux_2_17_aarch64.manylinux2014_aarch64.whl")
sha256sums=('ac044e6db7ba08069f635afc1759b0ae11a7d47f79144a4ccdd16fc94ba47d1e')
sha256sums_x86_64=('65aec11eaff5fa12bc548a16c8879856c66f549a2f8b1be5375d08e085899d7f')
sha256sums_aarch64=('08eb76adb4d6cd902633f3db3aeb78e38693b91de7efa1a02d37cab8f03e7d1f')

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
