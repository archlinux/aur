# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=pwclient-git
pkgver=r753.0a0f9d5
pkgrel=1
pkgdesc="Command-line client for patchwork"
url='https://github.com/getpatchwork/patchwork'
arch=('any')
license=('GPL')
source=("$url/raw/master/patchwork/bin/pwclient")
sha256sums=('SKIP')

pkgver() {
  api='https://api.github.com/repos/getpatchwork/patchwork'
  first='c561ebe710d6e6a43aa4afc6c2036a215378ce87'
  last_json=$(curl -s "$api/commits?per_page=1")
  last=$(echo "$last_json" | jq -r '.[0].sha')
  compare_json=$(curl -s "$api/compare/${first}...${last}")
  ahead_by=$(echo "$compare_json" | jq -r '.ahead_by')
  num=$((ahead_by+1))
  printf "r%d.%s" $num "${last:0:7}"
}

package() {
  install -Dm755 "${srcdir}"/pwclient "${pkgdir}"/usr/bin/pwclient
}
