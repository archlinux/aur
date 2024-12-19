# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=gitsync
pkgver=0.0.26
pkgrel=1
pkgdesc="GitSyncMaster: Effortlessly Automate Git Repository Updates, Including Committing and Pulling, Across Directory Structures."
arch=('x86_64')
url="https://github.com/felipealfonsog/GitSyncMaster"
license=('BSD 3-Clause')
depends=('python')

source=("https://github.com/felipealfonsog/GitSyncMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('a6e94e618f338b855ca0b9f718ac7d1aeae21b35dd7b28868594b3b85ba2b3bb')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the script - Python
  install -Dm755 "$srcdir"/GitSyncMaster-v."${pkgver}"/src/src-std/gitsync.py "${pkgdir}/usr/local/bin/gitsync.py"
  
  # Create a shell script to execute it and copy it to /usr/local/bin.
  echo '#!/bin/bash' > gitsync
  echo 'python /usr/local/bin/gitsync.py "$@"' >> gitsync
  chmod +x gitsync
  install -Dm755 gitsync "${pkgdir}/usr/local/bin/gitsync"
}

