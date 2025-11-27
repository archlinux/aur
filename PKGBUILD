# Maintainer: SaintFore <saintfore@example.com>
pkgname=leetcode-fsrs-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool for LeetCode practice using FSRS spaced repetition algorithm (minimal dependency version)"
arch=('any')
url="https://github.com/SaintFore/LeetCodeCLI"
license=('MIT')
depends=('python' 'python-click')
provides=('leetcode-fsrs-cli')
conflicts=('leetcode-fsrs-cli')
replaces=('leetcode-fsrs-cli')

source=("v${pkgver}.tar.gz::https://github.com/SaintFore/LeetCodeCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d75c0c035dca6981ad4b4ef99fccfa6515c112ea514bedd7c29c0387e5101dd')

package() {
  cd "LeetCodeCLI-${pkgver}"

  # Install Python package
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Create installation message
  install -d "${pkgdir}/usr/share/leetcode-fsrs-cli"
  cat > "${pkgdir}/usr/share/leetcode-fsrs-cli/INSTALL" << EOF
LeetCode FSRS CLI (Minimal Dependency Version) has been installed!

To get started:
1. Run: leetcode-fsrs init
2. Then: leetcode-fsrs practice

Your data will be stored in: ~/.config/leetcode-fsrs-cli/

This version has minimal dependencies (only python-click).

For more information, see: leetcode-fsrs --help
EOF
}