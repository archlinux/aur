# Maintainer: Your Name <youremail@example.com>
pkgname=history-plus
pkgver=1.0.0 # This should be updated for actual releases, or use -git for VCS
pkgrel=1
pkgdesc="Advanced auditing of shell commands, logging every command and its output in real-time."
arch=('any')
url="https://github.com/JSNrepo/history-plus"
license=('MIT')
depends=('bash') # Assuming bash is a dependency for the script
makedepends=('git') # For cloning the repository

source=("git+${url}.git")
sha256sums=('SKIP') # For git sources, sha256sums are usually skipped or generated dynamically

build() {
  cd "${srcdir}/history-plus"
  # The Makefile handles setting permissions and doesn't require a separate build step beyond that.
  # We just need to ensure the history+ script is executable.
  chmod +x history+ install.sh test.sh
}

package() {
  cd "${srcdir}/history-plus"
  # Install the main script
  install -D -m755 history+ "${pkgdir}/usr/bin/history+"

  # Install the license file
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Create the default configuration directory (optional, as it's user-specific)
  # It's generally better for the application to create this on first run if needed.
  # install -d "${pkgdir}/etc/${pkgname}"
  # install -m644 config.example "${pkgdir}/etc/${pkgname}/config.example"
}