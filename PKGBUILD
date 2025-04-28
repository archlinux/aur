# Maintainer: prime-run <prime-run@github.com>
# Contributor: jrodriigues <jrodriigues@github.com>

pkgname=hyde
pkgver=1.0.0
pkgrel=1
pkgdesc="project - hy reserverd de"
arch=('x86_64')
url="https://github.com/HyDE-Project/HyDE"
license=('MIT')
depends=() # Needed for makepkg to clone the source and potentially at runtime
source=("git+https://github.com/HyDE-Project/HyDE.git")
makedepends=('git' 'make' 'gcc')
sha256sums=('SKIP')

# pkgver() function generates the package version dynamically based on the latest commit date and hash
pkgver() {
  # Navigate into the cloned source directory
  cd "$srcdir/HyDE"
  # Get the latest commit date (YYYYMMDD format) and short commit hash
  printf "r%s.%s" "$(git log -1 --format=%cd --date=format:%Y%m%d)" "$(git rev-parse --short HEAD)"
}

# build() function performs build steps if necessary.
# For script-based projects, this is often empty or handled by the install script.
build() {
  # The install.sh script will likely handle any necessary build steps.
  # We can leave this empty for now.
  true
}

# package() function installs the built software into the fakeroot environment ($pkgdir)
package() {
  # Navigate to the Scripts directory within the cloned source tree
  cd "$srcdir/HyDE/Scripts"

  # Run the install.sh script.
  # We use the DESTDIR variable to tell the script to install into our fakeroot environment ($pkgdir)
  # instead of the system root directory. This requires install.sh to support DESTDIR.
  DESTDIR="$pkgdir" ./install.sh
}
