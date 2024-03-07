# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=gitsync
pkgver=0.0.4
pkgrel=1
pkgdesc="GitSyncMaster: Automate updating multiple Git repositories within a directory structure effortlessly."
arch=('x86_64')
url="https://github.com/felipealfonsog/GitSyncMaster"
license=('BSD 3-Clause')
depends=('python')

source=("https://github.com/felipealfonsog/GitSyncMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('336706b674e2a90de80a28941b0e96fefbbbb663f205cf7fccd1c13c6e60c4c6')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the script - Python
  install -Dm755 "$srcdir"/GitSyncMaster-v."${pkgver}"/src/aur-dev/git_updater.py "${pkgdir}/usr/local/bin/gitsync.py"
  
  # Create a shell script to execute it and copy it to /usr/local/bin.
  echo '#!/bin/bash' > gitsync
  echo 'python /usr/local/bin/gitsync.py "$@"' >> gitsync
  chmod +x gitsync
  install -Dm755 upd8all "${pkgdir}/usr/local/bin/gitsync"
}

