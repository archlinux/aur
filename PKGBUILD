# Maintainer: Nikola PHILIP-SINIBALDI <contact@patchli.fr>
pkgname=k2tf
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool for converting Kubernetes YAML into Terraform HCL"
arch=('x86_64')
url="https://github.com/sl1pm4t/k2tf"
license=('Mozilla Public License Version 2.0 ')
depends=()
makedepends=()
source=("https://github.com/sl1pm4t/k2tf/releases/download/v0.8.0/k2tf_0.8.0_Linux_amd64.tar.gz"
        "https://github.com/sl1pm4t/k2tf/releases/download/v0.8.0/checksums.txt")
sha256sums=('SKIP'  # This will be replaced by the actual checksum
            '92b428b1f24ab81ecab915fd115f0b0636cef09a7b6e12f0f63e0d4011a05ad6')

prepare() {
  cd "$srcdir"
  local source_tarball="k2tf_0.8.0_Linux_amd64.tar.gz"
  local checksums_file="checksums.txt"
  
  # Extract the expected checksum from the checksums file
  local expected_checksum=$(grep $source_tarball $checksums_file | awk '{print $1}')
  
  # Validate the downloaded tarball against the expected checksum
  echo "$expected_checksum  $source_tarball" | sha256sum -c - || return 1
}

package() {
  cd "$srcdir"
  tar -xzf "k2tf_0.8.0_Linux_amd64.tar.gz"
  
  # Install the binary to /usr/bin
  install -Dm755 k2tf "$pkgdir/usr/bin/k2tf"
}

# vim:set ts=2 sw=2 et:
