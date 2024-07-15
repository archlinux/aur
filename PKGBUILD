# Maintainer: Nikola PHILIP-SINIBALDI <contact@patchli.fr>
pkgname=k2tf
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool for converting Kubernetes YAML into Terraform HCL"
arch=('x86_64')
url="https://github.com/sl1pm4t/k2tf"
license=('Apache')
depends=('go' 'git')
makedepends=()
source=("https://github.com/sl1pm4t/k2tf/releases/download/v${pkgver}/k2tf_${pkgver}_Linux_amd64.tar.gz"
        "https://github.com/sl1pm4t/k2tf/releases/download/v${pkgver}/checksums.txt")
sha256sums=('SKIP'
            '92b428b1f24ab81ecab915fd115f0b0636cef09a7b6e12f0f63e0d4011a05ad6')

prepare() {
  cd "$srcdir"
  local source_tarball="k2tf_${pkgver}_Linux_amd64.tar.gz"
  local checksums_file="checksums.txt"
  
  local expected_checksum=$(grep $source_tarball $checksums_file | awk '{print $1}')
  
  echo "$expected_checksum  $source_tarball" | sha256sum -c - || return 1
}

package() {
  cd "$srcdir"
  tar -xzf "k2tf_${pkgver}_Linux_amd64.tar.gz"
  install -Dm755 k2tf "${pkgver}/usr/bin/k2tf"
}

# vim:set ts=2 sw=2 et:
