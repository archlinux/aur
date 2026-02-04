# Maintainer: SyreeseOfficial <syreese@example.com>
pkgname=focusnoise-cli-git
_pkgname=FocusNoiseCLI
pkgver=1.0.0.r1.g0f2126d
pkgrel=1
pkgdesc="Focus Noise Player CLI - Ambient sounds for deep focus"
arch=('any')
url="https://github.com/SyreeseOfficial/FocusNoiseCLI"
license=('MIT')
depends=('python' 'python-pygame' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('focusnoise-cli')
conflicts=('focusnoise-cli')
source=("git+https://github.com/SyreeseOfficial/FocusNoiseCLI.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
