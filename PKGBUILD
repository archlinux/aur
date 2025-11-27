# Maintainer: SaintFore <saintfore@example.com>
pkgname=leetcode-fsrs-cli-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A CLI tool for LeetCode practice using FSRS spaced repetition algorithm (minimal dependency version)"
arch=('any')
url="https://github.com/SaintFore/LeetCodeCLI"
license=('MIT')
depends=('python' 'python-click')
provides=('leetcode-fsrs-cli')
conflicts=('leetcode-fsrs-cli')
replaces=('leetcode-fsrs-cli')

source=("https://github.com/SaintFore/LeetCodeCLI/archive/refs/tags/v1.4.1.tar.gz")
sha256sums=('24c77d9b001e255c56712a76935abb6185b6c4a9c4eebebedd9329b231e1ceca')

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
